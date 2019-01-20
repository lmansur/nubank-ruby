require 'http'

module Nubank
  class Endpoint
    DISCOVERY = 'https://prod-s0-webapp-proxy.nubank.com.br/api/discovery'.freeze

    def initialize
      @reference = {}
    end

    def top_level_endpoints
      @top_level_endpoints ||= HTTP.get(DISCOVERY).parse
    end

    def populate(links)
      reference.merge!(links)
    end

    def login
      @login ||= top_level_endpoints['login']
    end

    def account
      @account ||= endpoint_for(:account)
    end

    def events
      @events ||= endpoint_for(:events)
    end

    def bills
      @bills ||= endpoint_for(:bills_summary)
    end

    private

    attr_reader :reference

    def endpoint_for(resource)
      reference[resource.to_s]['href']
    end
  end
end
