module ReactWebpackRails
  module Install
    class CoreGenerator < Rails::Generators::Base
      desc 'Create basic files structure, prepare package.json and webpack setup'
      source_root File.expand_path('../../templates', __FILE__)

      class_option :tmp_package,
                   type: :boolean,
                   default: false,
                   desc: 'Force update tmp/package.json instead package.json'


      def base
        copy_file '.babelrc', '.babelrc'
        copy_file '.eslintrc', '.eslintrc'
        create_file 'app/assets/javascripts/react_bundle.js'
        require_bundles_in_application_js
        template 'react/index.js', 'app/react/index.js'
      end

      def structure
        create_file 'app/react/components/.keep'
      end

      def gitignore
        append_file '.gitignore' do <<-'TEXT'.strip_heredoc
          /node_modules
          /app/assets/javascripts/react_bundle.js
          /app/assets/stylesheets/react_bundle.css
          TEXT
        end
      end

      def package
        if options.tmp_package
          copy_file 'packages/core.json', 'tmp/package.json', force: true
        else
          copy_file 'packages/core.json', 'package.json'
        end
      end

      def webpack
        copy_file 'webpack.config.js', 'webpack.config.js'
        copy_file 'webpack/dev.config.js', 'webpack/dev.config.js'
        copy_file 'webpack/production.config.js', 'webpack/production.config.js'
      end

      private

      def require_bundles_in_application_js
        manifest_file = Dir.glob('app/assets/javascripts/application.*').first

        case manifest_file
        when /.*\.coffee(\.erb)?$/
          requires = <<-REQUIRE_STRING.strip_heredoc
            #= require react_integration
            #= require react_bundle
          REQUIRE_STRING

          return if inject_into_file manifest_file, requires, before: '#= require_tree .'
          append_to_file manifest_file, requires
        when /.*\.js(\.erb)?$/
          requires = <<-REQUIRE_STRING.strip_heredoc
            //= require react_integration
            //= require react_bundle
          REQUIRE_STRING

          inject_into_file manifest_file, requires, before: '//= require_tree .'
          append_to_file manifest_file, requires
        else
          manifest_info = <<-NO_MANIFEST.strip_heredoc
            Missing manifest?

            Javascript manifest (normally application.js) could not be found.
            Please require following files in your manifest file:
            react_integration
            react_bundle

          NO_MANIFEST
          say_status(:not_found, manifest_info, :red)
        end
      end
    end
  end
end
