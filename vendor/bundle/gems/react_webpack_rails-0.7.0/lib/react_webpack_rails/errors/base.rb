module Errors
  class Base < RuntimeError
    def status
      fail NotImplementedError
    end

    def message
      fail NotImplementedError
    end
  end
end
