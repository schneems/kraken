require 'socket'

module Kraken
  # A simple client for KrakenLab server.
  # You can use this class to Debug the server with `kraken -c`
  # or implements your game using gosu gem!
  #
  #   a = Kraken::Client.new 'user', 'pass'
  #   a.connect 'localhost'
  #   a.call 'module::krakentrigger', {a: 2, b: [2,3,4], c: 'haha'}
  #   a.call 'module::krakentrigger', 'call only this'
  #   a.call 'module::krakentrigger', ['or this', 3]
  class Client
    def initialize(user, pass, version)
      @user = user
      @pass = pass
      @version = version
    end

    def close
      @socket.close unless @socket.nil?
    end

    def connect(host, port = 3030)
      @socket = TCPSocket.new(host, port)
      write @version
      write @user
      write @pass
      raise 'connection refused' unless read == 'ok'
    rescue StandardError
      raise 'connection refused'
    end

    def call(method, params)
      write method
      write to_args(params)
      read_args
    end

    private

    def read
      r = @socket.gets
      raise 'connection lost' if r.nil?
      r.chomp
    end

    def read_args
      type = read
      case type
      when 'h'
        return read_hash
      when 'v'
        return read_vector
      when 'n'
        return nil
      when 'a'
        return read
      end
    end

    def read_hash
      n = read.to_i
      awns = {}
      n.times { awns[read.to_sym] = read_args }
      awns
    end

    def read_vector
      n = read.to_i
      awns = []
      n.times { awns << read_args }
      awns
    end

    def write(txt)
      @socket.puts txt.chomp
    end

    def to_args(obj)
      case obj
      when Hash
        return "h\n#{obj.size}\n#{hash_protocol obj}"
      when Array
        return "v\n#{obj.size}\n#{vector_protocol obj}"
      when NilClass
        return 'n'
      end
      absolute_value(obj)
    end

    def hash_protocol(obj)
      ret = ''
      obj.each_pair { |key, value| ret += "#{key}\n#{to_args value}\n" }
      ret.chomp
    end

    def vector_protocol(obj)
      ret = ''
      obj.each { |value| ret += "#{to_args value}\n" }
      ret.chomp
    end

    def absolute_value(obj)
      "a\n#{obj}"
    end
  end
end
