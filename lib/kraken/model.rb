require 'redis'

module Kraken
  # Every class that represents data must inherit this object.
  class Model
    attr_reader :path

    @@redis = Redis.new

    def initialize(path = '/')
      @path = path
    end

    def get_attr(att='.')
      @@redis.get "#{@path}/#{att}"
    end

    def set_attr(att='.', value='0')
      @@redis.set "#{@path}/#{att}", value
    end
  end
end
