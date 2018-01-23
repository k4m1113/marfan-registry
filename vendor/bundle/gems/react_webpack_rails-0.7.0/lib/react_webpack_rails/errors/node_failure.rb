module Errors
  class NodeFailure < Base
    attr_accessor :message

    def initialize(message)
      @message = message
    end

    def status
      500
    end
  end
end
