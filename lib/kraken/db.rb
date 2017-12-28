require 'ohm'
require 'active_record'

module Kraken
  Migration = ActiveRecord::Migration
  Db = ActiveRecord::Base

  Ohm.redis = Redic.new

  Kraken::Db.establish_connection(adapter: 'postgresql',
                                  database: 'kraken',
                                  host: 'localhost',
                                  port: '5432',
                                  username: 'postgres',
                                  password: 'postgres')
end
