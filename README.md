# Nubank

This is an unofficial client of the undocumented Nubank API.
It may be unstable. You may have your access temporarily blocked if used too much.
**Use at your own risk.**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nubank'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nubank

## Usage

### Client Instantiation

```ruby
client = Nubank::Client.new(
  "12345678901" # Your CPF
  "123456"      # Your Password
)
```

### Authentication

```ruby
client.login
```

**CAUTION: Hitting this endpoint repeatedly will block future login attempts temporarily, even in the Web interface.**

### Account

```ruby
client.account
```

Returns your account information, such as `due_date`, `available_balance` and `balances`.

### Events

```ruby
client.events
```

Returns all the events for your account, starting with the most recent. This includes transactions, bill payment, limit change, card activation and more.

### Response handling

```ruby
response = client.events

response.code # => 200
response.body # => Serialized body
response.parsed_body # => JSON body
```

### Resource objects

To access the Resource object, use `Response#resource`. For example:

```ruby
response = client.events
events = response.resource
```

The Resource object responds to all the attributes the API exposes:

```ruby
events.each do |event|
  puts event.description
  puts event.amount if event.category == "transaction"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nubank.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
