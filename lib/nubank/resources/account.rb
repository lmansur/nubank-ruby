require_relative 'base'

module Nubank
  module Resources
    class Account < Base
      attribute :id, Types::Coercible::String
      attribute :due_day, Types::Coercible::Integer
      attribute :product_id, Types::Coercible::String
      attribute :available_balance, Types::Params::Decimal
      attribute :temporary_limit_amount, Types::Params::Decimal
      attribute :limit_range_min, Types::Params::Decimal
      attribute :future_balance, Types::Params::Decimal
      attribute :current_interest_rate, Types::Params::Decimal
      attribute :precise_credit_limit, Types::Params::Decimal
      attribute :over_limit_amount, Types::Params::Decimal
      attribute :next_due_date, Types::Params::Date
      attribute :interest_rate, Types::Params::Decimal
      attribute :status, Types::Coercible::String
      attribute :card_active_since, Types::Params::DateTime
      attribute :net_available, Types::Params::Decimal
      attribute :limit_range_max, Types::Params::Decimal
      attribute :next_close_date, Types::Params::Date
      attribute :current_balance, Types::Params::Decimal
      attribute :created_at, Types::Params::DateTime
      attribute :request_id, Types::Coercible::String
      attribute :customer_id, Types::Coercible::String
      attribute :credit_limit, Types::Params::Decimal
      attribute :balances, Types::Hash.schema(
        'future' => Types::Params::Decimal,
        'open' => Types::Params::Decimal,
        'due' => Types::Params::Decimal,
        'prepaid' => Types::Params::Decimal,
        'available' => Types::Params::Decimal
      )

      def self.new(args)
        super(args['account'])
      end
    end
  end
end
