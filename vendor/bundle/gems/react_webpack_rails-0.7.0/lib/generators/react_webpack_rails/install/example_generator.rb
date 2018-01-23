module ReactWebpackRails
  module Install
    class ExampleGenerator < Rails::Generators::Base
      desc 'Add example component, its controller and router'
      source_root File.expand_path('../../templates', __FILE__)

      class_option :server_side,
                   type: :boolean,
                   default: true,
                   desc: 'Set server_side: true in example'

      def es6_example
        copy_file 'react/components/hello-world-test.jsx', 'app/react/components/hello-world-test.jsx'
        copy_file 'react/components/hello-world.jsx', 'app/react/components/hello-world.jsx'
        inject_into_file 'app/react/index.js', after: "RWR.run();\n" do <<-'JS'.strip_heredoc

          import HelloWorld from './components/hello-world';
          RWR.registerComponent('HelloWorld', HelloWorld);
          JS
        end
      end

      def controller_and_view
        copy_file 'examples/react_examples_controller.rb', 'app/controllers/react_examples_controller.rb'
        template = "examples/#{options.server_side ? 'ssr-' : ''}component_view.html.erb"
        copy_file template, 'app/views/react_examples/component.html.erb'
      end

      def example_route
        route "get 'react_examples/component', to: 'react_examples#component', as: :component"
      end
    end
  end
end
