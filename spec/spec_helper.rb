require 'kraken'
require 'faker'

RSpec.configure do |config|
  Kraken::Log.close
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
