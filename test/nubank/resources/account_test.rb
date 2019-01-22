require 'test_helper'

describe Nubank::Resources::Account do
  let(:args) do
    {
      'account' => {
        'id' => '1234abcd',
        'due_day' => 9,
        'product_id' => 'abc321',
        'available_balance' => 4000,
        'temporary_limit_amount' => 0,
        'limit_range_min' => 0,
        'future_balance' => 300,
        'current_interest_rate' => 0.14,
        'precise_credit_limit' => 4500,
        'over_limit_amount' => 0,
        'next_due_date' => '2019-01-08',
        'interest_rate' => '0.14',
        'status' => 'active',
        'card_active_since' => '2018-11-27T18:00:47.308Z',
        'net_available' => 4000,
        'limit_range_max' => 4500,
        'next_close_date' => '2019-01-01',
        'current_balance' => 4000,
        'created_at' => '2018-11-27T18:00:47.308Z',
        'request_id' => 'some-huge-string-with-numbers123',
        'customer_id' => 'aa12',
        'credit_limit' => 4500,
        'balances' => {
          'future' => 0,
          'open' => 1500,
          'due' => 0,
          'prepaid' => 0,
          'available' => 3000
        }
      }
    }
  end

  it 'creates Account with given parameters' do
    Nubank::Resources::Account.new(args).attributes.must_equal(
      id: '1234abcd',
      due_day: 9,
      product_id: 'abc321',
      available_balance: BigDecimal(4000),
      temporary_limit_amount: BigDecimal(0),
      limit_range_min: BigDecimal(0),
      future_balance: BigDecimal(300),
      current_interest_rate: BigDecimal('0.14'),
      precise_credit_limit: BigDecimal(4500),
      over_limit_amount: BigDecimal(0),
      next_due_date: Date.new(2019, 1, 8),
      interest_rate: BigDecimal('0.14'),
      status: 'active',
      card_active_since: Time.parse('2018-11-27T18:00:47.308Z'),
      net_available: BigDecimal(4000),
      limit_range_max: BigDecimal(4500),
      next_close_date: Date.new(2019, 1, 1),
      current_balance: BigDecimal(4000),
      created_at: Time.parse('2018-11-27T18:00:47.308Z'),
      request_id: 'some-huge-string-with-numbers123',
      customer_id: 'aa12',
      credit_limit: BigDecimal(4500),
      balances: {
        'future' => BigDecimal(0),
        'open' => BigDecimal(1500),
        'due' => BigDecimal(0),
        'prepaid' => BigDecimal(0),
        'available' => BigDecimal(3000)
      }
    )
  end
end
