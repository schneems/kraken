require 'redis'

module Kraken
  # Every class that represents data must inherit this object.
  class Model
    attr_reader :path

    @@redis = Redis.new

    def initialize(path = '/')
      @path = path
    end

    def [](arg)
      @@redis.get("#{@path}/#{arg}")
    end

    def []=(arg,value)
      @@redis.set("#{@path}/#{arg}",value)
    end
  end
end
