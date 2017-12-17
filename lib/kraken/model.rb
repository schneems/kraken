require 'redis'

module Kraken
  # Every class that represents data must inherit this object.
  class Model
    attr_reader :path

    @@redis = Redis.new

    def initialize(path = '/')
      @path = path
    end

    def valid?
      true
    end

    def async
      @@redis.pipelined do
        yield
      end
    end

    def atomic
      @@redis.multi do
        yield
      end
    end

    def del(arg)
      @@redis.del("#{@path}/#{arg}")
    end

    def [](arg)
      @@redis.get("#{@path}/#{arg}")
    end

    def []=(arg,value)
      raise 'invalid data' unless valid?
      @@redis.set("#{@path}/#{arg}",value)
    end
  end
end
