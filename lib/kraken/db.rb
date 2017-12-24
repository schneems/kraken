require 'ohm'
require 'data_mapper'

Ohm.redis = Redic.new

DataMapper.setup(:default,
  'postgres://postgres:postgres@localhost/kraken'
)
