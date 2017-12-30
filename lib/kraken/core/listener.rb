require 'socket'
require 'kraken/core/handler'

module Kraken
  # This class receives the TCP connections.
  class Listener
    def initialize
      @manager = TCPServer.new 3030
      @thread = Thread.new { start }
    end

    def start
      loop do
        Kraken::Handler.new @manager.accept
        Kraken::Log.info 'wild socket appeared!'
      end
    end

    def close
      @thread.kill
      @manager.close
    end

    def join
      @thread.join
    end
  end
end
