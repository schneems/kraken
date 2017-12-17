require 'socket'
require 'kraken/handler'

module Kraken
  # This class receives the TCP connections.
  class Listener
    def initialize
      @manager = TCPServer.new 3030
      @thread = Thread.new { start }
    end

    def start
      loop do
        handler = Kraken::Handler.new @manager.accept
        Thread.new { handler.start }
        Kraken::Log.info 'wild socket appeared!'
      end
    end

    def close
      @thread.kill
      @manager.close
    end
  end
end
