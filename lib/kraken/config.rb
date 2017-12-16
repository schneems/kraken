require 'singleton'

module Kraken
  # Configure the kraken framework.
  # You can configure the server, postgre and redis.
  # You can configure the events in server.
  # Yes! You can configure other plugins here!
  #
  #    Kraken::Config.instance.setup do |config|
  #        config.server name: 'hehe'
  #    end
  class Config
    include Singleton

    attr_reader :server_name, :server_token, :server_version

    def setup
      yield self
    end

    def server(name: 'kraken app', token: 'valid token', version: 'valid version')
      @server_name = name
      @server_token = token
      @server_version = version
    end
  end
end
