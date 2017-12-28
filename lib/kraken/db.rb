require 'ohm'
require 'active_record'

Ohm.redis = Redic.new

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'kraken',
                                        host: 'localhost',
                                        port: '5432',
                                        username: 'postgres',
                                        password: 'postgres')
