[![Build Status](https://travis-ci.org/KrakenLab/kraken.svg?branch=master)](https://travis-ci.org/KrakenLab/kraken)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/518f7a2f6a2f43bf9002b75ceff439a6)](https://www.codacy.com/app/Schweigert/kraken?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=KrakenLab/kraken&amp;utm_campaign=Badge_Grade)
[![Gem Version](https://badge.fury.io/rb/krakenlab.svg)](https://badge.fury.io/rb/krakenlab)
[![Code Triagers Badge](https://www.codetriage.com/krakenlab/kraken/badges/users.svg)](https://www.codetriage.com/krakenlab/kraken)
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/KrakenLab/kraken.svg)](https://beta.gemnasium.com/projects/github.com/KrakenLab/kraken)

# Welcome to Kraken!

Kraken is a mmo server framework that includes everything needed to create database-backed according to the Model-View-Controller (MVC) pattern over a distribuited redis network.

It's works with:
 - Redis, to distribute game data over all nodes in network.
 - Postgre, To save all permanent data.

Applications developed with kraken have 4 pillars:
 - Db instances, saved on Postgre. Database instances are organized by ActiveRecord.
 - Model instances, saved over a Redis Cloud. Model instances are organized by Ohm, a Mapper to redis.
 - Triggers and Callbacks, to made the Remote Call Procedure to server, organized by Kraken.

## Model

  `Model` are the first pillar from MVC pattern. But, in Kraken, Models are divided into memory and database instances.

  The `Kraken::Db` is a shortcut to Active Record. You can write Db models to Sqlite, PostgreSQL, MySQL and others Db's.

  On the other hand, `Kraken::Model` is a shortcut to Ohm mapper. It's write all data in redis-server.
  Be careful! Redis has no garbage collection. Always write the `on_delete` method to garbage data on user disconnection. You can also use this method to write permanent game state updates to the database.

## View

  `View` are the second pillar from MVC pattern. In kraken, view are the callback of a trigger. It's are a simple data, a array or a hash! You do not need to worry about it! Just write the return! Kraken translates all this to you!

  ```ruby
    class Example < Kraken::Trigger
      def run
        puts params
        @callback = [1,2,3,4,5]
      end
    end

    Kraken::Config.instance.setup do |config|
      config.add_trigger klass: Example
    end
  ```

  ```ruby
    require 'kraken/client'

    a = Kraken::Client.new('user', 'pass')
    a.connect('localhost', 3030)
    a.call('example', {a: 'hehe'})
    # => [1,2,3,4,5]
  ```

## Controller

  The `controller` is the logical pillar from MVC! This is a Trigger! Triggers are events that can be triggered by a client, using some argument.

  You must use the Models in the triggers to update the game states in Database, and use the callback to return and update the game on the client side.

# Installation

#### Postgre

```bash
  sudo apt-get install postgresql postgresql-contrib libpq-dev
```

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

#### Kraken Framework

Install the kraken:
    `$ gem install kraken`

Create a new KrakenApp:
    `$ kraken -n app_name`

Use the `migrate.rb` to setup a fixed start database.

Add a config file in config path:

```ruby
# config/config.rb
Kraken::Config.instance.setup do |config|
  config.server name: 'new_app'

  config.add_trigger klass: Characters::Index
  config.add_trigger klass: Characters::New
end

Ohm.redis = Redic.new

Kraken::Db.establish_connection(adapter: 'postgresql',
                                database: 'kraken',
                                host: 'localhost',
                                port: '5432',
                                username: 'postgres',
password: 'postgres')
```

and setup a new method authentication method:
```ruby
#config/connection.rb
class Kraken::Connection < Kraken::Model
  set :characters, :Character

  attr_accessor :account
  attr_accessor :cache

  def on_delete
    characters.each { |character| character.delete }
    @cache.each_key { |key| @cach[key].delete }
  end

  # The standard is to allow everyone!
  # Implement it!
  def authenticate
    @account = Db::Account.where(user: user).first
    return false if account.nil?
    return false unless account.user == user && account.pass == pass

    @cache = {}

    true
  end
end

```

and run this!: `kraken -s`

# Development

After checking out the repo, run `bundle install` to install dependencies. You can also run `rake console` for an interactive prompt that will allow you to experiment.

## Version

As we release many stable versions for testing, and we price by incremental implementation, the only rule for the versions is: `Year.Month.Day`

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/KrakenLab/kraken.

Perform automated and manual testing using the console. Do not forget to check the style using `rubocop`.
We will help with possible problems in your PR '\\o/'!

### contributors

- [Marlon Henry Schweigert](http://github.com/Schweigert)

# License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
