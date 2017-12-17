require 'socket'
require 'thread'

module Kraken
  # This class handle a Socket.
  class Handler
    def initialize(socket)
      @socket = socket
    end

    def start
      loop do
        # TODO
        sleep 1
        Kraken::Log.info @socket.gets.chomp
      end
    end
  end
end
