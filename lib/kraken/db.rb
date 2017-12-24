require 'ohm'
require 'singleton'

Ohm.redis = Redic.new

ActiveRecord::Base.establish_connection(
  'postgres://postgres:postgres@localhost/kraken'
)
