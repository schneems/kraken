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

    def close
      @connection.delete unless @connection.nil?

      Kraken::Log.info 'bye bye socket'

      @socket.close
      @thread.kill
    end

    def read_trigger
      trigger = read
      args = read_args
      return Kraken::Config.instance.triggers[trigger.downcase], args
    end

    private

    def start
      user = read
      pass = read
      @connection = Connection.create(user: user, pass: pass)

      raise 'only one connection by user' unless @connection.single_user?

      write 'ok'

      work
      close
    end

    def work
      loop do
        trigger, args = read_trigger

        Kraken::Log.info trigger
        Kraken::Log.info args

        trigger.new(self, args).run
      end
    end

    def read
      r = @socket.gets
      raise 'connection lost' if r.nil?
      r.chomp
    end

    def read_args
      type = read
      case type
      # Hash case
      when 'h'
        n = read.to_i
        awns = {}
        n.times { awns[read.to_sym] = read_args }
        return awns
      # Vector case
      when 'v'
        n = read.to_i
        awns = []
        n.times { awns << read_args }
        return awns
      # Null value
      when 'n'
        return nil
      # Absolute value
      when 'a'
        return read
      end
    end

    def write(txt)
      @socket.puts txt.chomp
    end
  end
end
