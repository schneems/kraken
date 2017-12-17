require 'redis'
require 'singleton'

module Kraken
  # This class manage the DB.
  # It's used by model class.
  class Db
    include Singleton

    attr_accessor :redis

    def setup
      @redis = Redis.new
    end
  end
end
