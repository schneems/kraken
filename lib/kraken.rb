require 'kraken/version'

# Main module from Kraken Framework
module Kraken
end

require 'kraken/client'
require 'kraken/config'
require 'kraken/listener'
require 'kraken/log'
require 'kraken/model'
require 'kraken/trigger'

def load_app
  require 'require_all'
  require_all 'app/validators' if File.exist? 'app/validators'
  require_all 'app' if File.exist? 'app'
  require_all 'config' if File.exist? 'config'
end
