require 'http'
require_relative 'response'

module Nubank
  class Request
    attr_reader :response

    def initialize(method, endpoint, access_token = nil, options = {})
      @method = method
      @endpoint = endpoint
      @access_token = access_token
      @options = options
    end

    def run
      response = HTTP.auth(authorization)
                     .send(method, endpoint, options)

      @response = Response.new(response)
    end

    private

    attr_reader :method, :endpoint, :access_token, :options

    def authorization
      @authorization = access_token ? "Bearer #{access_token}" : ''
    end
  end
end
