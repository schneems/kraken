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
        rescue StandardError => e
          Kraken::Log.error e
          close
        end
      end
    end

    def start
      user = read
      pass = read
      @connection = Connection.create(user: user, pass: pass)

      raise 'only one connection by user' if @connection.single_user?
    end

    def read
      r = @socket.gets
      raise 'connection lost' if r.nil?
      r.chomp
    end

    def write(txt)
      @socket.puts txt.chomp
    end

    def close
      unless @connection.nil?
        @connection.delete
      end
      @thread.kill
      @socket.close
    end
  end
end
