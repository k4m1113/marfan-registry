module ReactWebpackRails
  module Install
    require 'generators/react_webpack_rails/merge_helpers'

    class KarmaSetup < Rails::Generators::Base
      include MergeHelpers
      desc 'Add karma setup with mocha and except'
      source_root File.expand_path('../../templates', __FILE__)

      class_option :tmp_package,
                   type: :boolean,
                   default: false,
                   desc: 'Force update tmp/package.json instead package.json'

      def package
        merge_options = options.tmp_package ? { package_file: 'tmp/package.json', force: true } : {}
        merge_into_package 'packages/js-specs.json', merge_options
      end

      def karma_config
        copy_file 'karma.conf.js', 'karma.conf.js'
        copy_file 'webpack/tests.config.js', 'webpack/tests.config.js'
      end
    end
  end
end
