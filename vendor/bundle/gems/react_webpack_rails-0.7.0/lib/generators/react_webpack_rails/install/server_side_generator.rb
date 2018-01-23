module ReactWebpackRails
  module Install
    require 'generators/react_webpack_rails/merge_helpers'

    class ServerSideGenerator < Rails::Generators::Base
      include MergeHelpers
      desc 'Add and setup node server for server side execution'
      source_root File.expand_path('../../templates', __FILE__)

      class_option :tmp_package,
                   type: :boolean,
                   default: false,
                   desc: 'Force update tmp/package.json instead package.json'

      def package
        merge_options = options.tmp_package ? { package_file: 'tmp/package.json', force: true } : {}
        merge_into_package 'packages/server-side.json', merge_options
      end

      def forever
        copy_file 'forever/development.json', 'forever/development.json'
        copy_file 'forever/production.json', 'forever/production.json'
        create_file 'app/react/.foreverignore'
      end

      def node_server
        copy_file 'react/node_server.js', 'app/react/node_server.js'
      end
    end
  end
end
