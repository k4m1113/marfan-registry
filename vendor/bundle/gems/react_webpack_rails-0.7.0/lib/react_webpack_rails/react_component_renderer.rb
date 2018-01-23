module ReactWebpackRails
  class ReactComponentRenderer
    include ReactWebpackRails::ViewHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper

    attr_accessor :output_buffer

    def call(name, props, options)
      react_component(name, props, options)
    end
  end
end
