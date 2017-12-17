require 'socket'
require 'thread'

module Kraken
  # This class handle a Socket.
  class Handler
    def initialize socket
      @socket = socket
      start
    end

    private

    def start
      loop do
        # TODO
        sleep 1
        Kraken::info @socket.gets.chomp
      end
    end
  end
end
