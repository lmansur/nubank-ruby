require_relative 'base'

module Nubank
  module Resources
    class Event < Base
      transform_types { |type| type.meta(omittable: true) }

      attribute :id, Types::Coercible::String
      attribute :description, Types::Coercible::String
      attribute :message, Types::Coercible::String
      attribute :category, Types::Coercible::String
      attribute :amount, Types::Params::Decimal
      attribute :time, Types::Params::DateTime
      attribute :title, Types::Coercible::String
      attribute :details, Types::Hash.with_type_transform { |type| type.meta(omittable: true) }.schema(
        fx: Types::Hash.with_type_transform { |type| type.meta(omittable: true) }.schema(
          currency_origin: Types::Coercible::String,
          amount_origin: Types::Params::Decimal,
          amount_usd: Types::Params::Decimal,
          precise_amount_origin: Types::Params::Decimal,
          precise_amount_usd: Types::Params::Decimal,
          exchange_rate: Types::Params::Decimal
        ),
        lat: Types::Params::Float,
        lon: Types::Params::Float,
        subcategory: Types::Coercible::String
      )

      def self.new(args)
        symbolized_args = args.deep_symbolize_keys
        super(symbolized_args)
      end
    end
  end
end

class Hash
  def deep_symbolize_keys
    deep_transform_keys(self, &:to_sym)
  end

  private

  def deep_transform_keys(object, &block)
    case object
    when Hash
      object.each_with_object({}) do |(key, value), result|
        result[yield(key)] = deep_transform_keys(value, &block)
      end
    when Array
      object.map { |e| deep_transform_keys(e, &block) }
    else
      object
    end
  end
end
