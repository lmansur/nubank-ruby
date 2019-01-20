require_relative 'event'

module Nubank
  module Resources
    class Events < Array
      def initialize(events)
        events['events'].map { |event| self << Event.new(event) }
      end
    end
  end
end
