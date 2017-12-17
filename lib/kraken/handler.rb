require 'socket'
require 'thread'

require 'kraken/models/connection'

module Kraken
  # This class handle a Socket.
  class Handler
    def initialize(socket)
      @socket = socket
      @thread = Thread.new do
        begin
          start
        rescue StandardError? => e
          Kraken::Log.error e
        end
      end
    end

    def start
      user = read
      pass = read
      @connection = Connection.create(user: user, pass: pass)
      Kraken::Log.info @connection.user
    end

    def read
      r = @socket.gets
      raise 'connection lost' if r.nil?
      r.chomp
    end

    def write(txt)
      @socket.puts txt.chomp
    end
  end
end
