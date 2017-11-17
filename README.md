# Cryptobank

Cryptobank provides Ruby wrappers for the Bitcoin API JSON-RPC.

This gem is still in development. Please feel free to contribute and make a pull request. As the gem is called 'cryptobank', it will evole into a more general toolbox for working with crypocurrencies.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptobank'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptobank

## Usage

```
class Bitcoind
  extend Cryptobank
end

Bitcoind.configure do |config|
  config.host = '127.0.0.1' # default: 'localhost'
  config.port = 8332           # default: 8543
  config.user = 'admin'         # default: 'rpcuser'
  config.password = 'swordfish' # default: 'rpcpassword'
end

Bitcoind.new_address #=> '14gnToPKhRKhRKXZHV4mJyu8N5EFAoFU6G'

account = "LolCat"
Bitcoind.balance(account) #=> 3.73094258
Bitcoind.get_account_addresses(account)
```

Please see lib/cryptobank/cryptobank.rb for the methods that are currently implemented.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Cryptobank. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cryptobank project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Cryptobank/blob/master/CODE_OF_CONDUCT.md).

## Credit

Credit goes to the gem 'Coinable' for inspiring this gem.
