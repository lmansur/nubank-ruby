require 'http'
require_relative 'endpoint'
require_relative 'request'
require_relative 'resources/account'
require_relative 'resources/events'

module Nubank
  class Client
    CLIENT_SECRET = 'yQPeLzoHuJzlMMSAjC-LgNUJdUecx8XO'.freeze
    CLIENT_ID = 'other.conta'.freeze
    GRANT_TYPE = 'password'.freeze

    def initialize(identification, password)
      @identification = identification
      @password = password
      @access_token = nil
      @endpoint = Endpoint.new
    end

    def login
      @login ||= begin
                   request = Request.new(:post, endpoint.login, access_token, json: login_params)
                   request.run.tap do |response|
                     body = response.parsed_body
                     endpoint.populate(body['_links'])
                     @access_token = body['access_token']
                   end
                 end
    end

    def account
      request = Request.new(:get, endpoint.account, access_token)
      request.run.tap { |response| response.resource = Resources::Account }
    end

    def events
      request = Request.new(:get, endpoint.events, access_token)
      request.run.tap { |response| response.resource = Resources::Events }
    end

    private

    attr_reader :identification, :password, :access_token, :endpoint

    def login_params
      {
        login: identification,
        password: password,
        client_id: CLIENT_ID,
        client_secret: CLIENT_SECRET,
        grant_type: GRANT_TYPE
      }
    end

    def authorization
      @authorization ||= "Bearer #{access_token}"
    end
  end
end
