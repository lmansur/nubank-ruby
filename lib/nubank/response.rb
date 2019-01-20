module Nubank
  class Response
    attr_writer :resource
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def resource
      @resource.new(parsed_body)
    end

    def parsed_body
      @parsed_body ||= @response.parse
    end

    def body
      @response.body
    end

    def code
      @response.code
    end
  end
end
