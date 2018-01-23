require 'react_webpack_rails/view_helpers'
require 'react_webpack_rails/react_component_renderer'

module ReactWebpackRails
  class Railtie < ::Rails::Railtie
    # Sensible defaults. Can be overridden in application.rb.

    # gem related config default:
    config.rwr = ActiveSupport::OrderedOptions.new
    config.rwr.node_server_host = 'http://localhost:8081/'

    # react integration related config default:
    config.react = ActiveSupport::OrderedOptions.new
    config.react.camelize_props = false
    config.react.server_side = false
    config.react.shared = {}

    initializer 'react_webpack_rails.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer 'react_webpack_rails.add_react_component_renderer' do
      ActionController::Renderers.add :react_component do |name, options = {}|
        renderer = ReactWebpackRails::ReactComponentRenderer.new
        component_options = options.slice(:aria, :class, :data, :id, :tag, :server_side)
        props = options.delete(:props)

        html = renderer.call(name, props, component_options)
        render_options = options.merge(inline: html)

        render(render_options)
      end
    end
  end
end
