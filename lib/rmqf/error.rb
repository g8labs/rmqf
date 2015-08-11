module Rmqf

  class Error < StandardError

    attr_reader :response

    def initialize(response)
      @response = response
    end

    def message
      "Check response for more details"
    end

  end

end
