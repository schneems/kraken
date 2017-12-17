[![Build Status](https://travis-ci.org/KrakenLab/kraken.svg?branch=master)](https://travis-ci.org/KrakenLab/kraken)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/518f7a2f6a2f43bf9002b75ceff439a6)](https://www.codacy.com/app/Schweigert/kraken?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=KrakenLab/kraken&amp;utm_campaign=Badge_Grade)

# Kraken

A easy way to write your MMO distribuited server.

## Installation

#### Redis

```bash
  cd /tmp
  curl -O http://download.redis.io/redis-stable.tar.gz
  tar xzvf redis-stable.tar.gz
  cd redis-stable
  make
  sudo make install

  sudo service redis start
```

##### Kraken Framework

Add this line to your application's Gemfile:

```ruby
  gem 'kraken'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kraken

## Usage

Use this template: (kraken-template)[https://github.com/KrakenLab/kraken-template]

Just type in root:

  $ kraken s


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/KrakenLab/kraken.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
