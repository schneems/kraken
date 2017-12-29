require 'ohm'
require 'active_record'
require 'active_record_migrations'

# In db.rb file has some definitions to warp modules from other gens to Kraken framework.
module Kraken
  Db = ActiveRecord::Base
  Migration = ActiveRecord::Migration
  Migrations = ActiveRecordMigrations

  Ohm.redis = Redic.new

  Kraken::Db.establish_connection(adapter: 'postgresql',
                                  database: 'kraken',
                                  host: 'localhost',
                                  port: '5432',
                                  username: 'postgres',
                                  password: 'postgres')
end
