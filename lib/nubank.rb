require 'nubank/version'
require 'nubank/client'

module Nubank
  class Error < StandardError; end

  def self.client(identification, password)
    Client.new(identification, password)
  end
end
