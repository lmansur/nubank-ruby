require 'dry-struct'

module Nubank
  module Resources
    class Base < Dry::Struct
      transform_keys(&:to_sym)

      module Types
        include Dry::Types.module
      end
    end
  end
end
