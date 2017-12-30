require 'ohm'
require 'yaml'
require 'active_record'
require 'active_record_migrations'

# In db.rb file has some definitions to warp modules from other gens to Kraken framework.
module Kraken
  StaticModel = ActiveRecord::Base
  Migration = ActiveRecord::Migration
  Migrations = ActiveRecordMigrations

  Ohm.redis = Redic.new

  if File.exist? 'db/config.yml'
    Kraken::StaticModel.establish_connection(YAML.load(File.read('config/db.yml'))['development'])
  else
    Kraken::StaticModel.establish_connection(adapter: 'postgresql',
                                             database: 'kraken',
                                             host: 'localhost',
                                             port: '5432',
                                             username: 'postgres',
                                             password: 'postgres')
  end
end
