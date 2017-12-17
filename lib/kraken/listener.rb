require 'socket'
require 'kraken/handler'

module Kraken
  # This class receives the TCP connections.
  class Listener
    def initialize
      @manager = TCPServer.new 3030
      start
    end

    private

    def start
      loop do
        Kraken::Handler.new @manager.accept
        Kraken::Log.info 'wild socket appeared!'
      end
    end
  end
end
