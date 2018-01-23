module ReactWebpackRails
  module Install
    require 'generators/react_webpack_rails/merge_helpers'

    class ReduxGenerator < Rails::Generators::Base
      include MergeHelpers
      desc 'Add redux setup'
      source_root File.expand_path('../../templates', __FILE__)

      REACT_INDEX_FILE = 'app/react/index.js'

      class_option :tmp_package,
                   type: :boolean,
                   default: false,
                   desc: 'Force update tmp/package.json instead package.json'

      def package
        merge_options = options.tmp_package ? { package_file: 'tmp/package.json', force: true } : {}
        merge_into_package 'packages/redux.json', merge_options
      end

      def add_import
        inject_into_file REACT_INDEX_FILE, after: "import RWR from 'react-webpack-rails';\n" do
          <<-'JS'.strip_heredoc
            import RWRRedux from 'rwr-redux';

          JS
        end
      end

      def gsub_rwr_import
        old_line = "import RWR from 'react-webpack-rails';"
        new_line = "import RWR, { integrationsManager } from 'react-webpack-rails';"
        gsub_file REACT_INDEX_FILE, old_line, new_line
      end

      def add_integration_managers
        inject_into_file REACT_INDEX_FILE, after: "RWR.run();\n" do
          <<-'JS'.strip_heredoc

            integrationsManager.register('redux-store', RWRRedux.storeIntegrationWrapper);
            integrationsManager.register('redux-container', RWRRedux.containerIntegrationWrapper);
          JS
        end
      end

      def add_rwr_redux
        append_file 'Gemfile' do
          <<-'RB'.strip_heredoc
            gem 'rwr-redux'
          RB
        end
      end
    end
  end
end
