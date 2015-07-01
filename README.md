# Rmqf

Rmqf is a ruby wrapper for the SMS Globalnet MQF API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rmqf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rmqf

## Usage

### Authentication

For authentication you will need to provide multiple elements, they are:

- OAuth Consumer Key
- OAuth Consumer Secret
- OAuth Access Token
- OAuth Access Secret

This parameters can be configured globally like this for example:

```
Rmqf.configure do |c|
  c.consumer_key = ENV['MQF_CONSUMER_KEY']
  c.consumer_secret = ENV['MQF_CONSUMER_SECRET']
  c.access_token = ENV['MQF_ACCESS_TOKEN']
  c.access_secret = ENV['MQF_ACCESS_SECRET']
end
```

If you don't want to make this a global configuration you can create a Rmqf::Configuration.

```
config = Rmqf::Configuration.new

config.consumer_key = ENV['MQF_CONSUMER_KEY']
config.consumer_secret = ENV['MQF_CONSUMER_SECRET']
config.access_token = ENV['MQF_ACCESS_TOKEN']
config.access_secret = ENV['MQF_ACCESS_SECRET']
```

### API Usage

For using the API you need to create a Rmfq::API object and start using the methods.
When you initialize this object you can pass a configuration if you don't want to use the global one.

```
# With global configuration
mqf = Rmfq::API.new

# Get carriers
mqf.get_carriers

# Create subscriber
mqf.create_subscriber(123, '59899202020', 'wap')
```

Take a look at the docs for more information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/g8labs/rmqf.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
