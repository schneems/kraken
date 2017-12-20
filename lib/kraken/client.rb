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
    def initialize(user, pass)
      @user = user
      @pass = pass
    end

    def close
      @socket.close unless @socket.nil?
    end

    def connect(host, port = 3030)
      @socket = TCPSocket.new(host, port)
      @socket.puts @user
      @socket.puts @pass
      raise 'connection refused' unless @socket.gets.chomp == 'ok'
    rescue StandardError
      raise 'connection refused'
    end

    def call(method, params)
      @socket.puts method.chomp
      @socket.puts params_protocol(params).chomp
    end

    private

    def params_protocol(obj)
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
      obj.each_pair { |key, value| ret += "#{key}\n#{params_protocol value}\n" }
      ret.chomp
    end

    def vector_protocol(obj)
      ret = ''
      obj.each { |value| ret += "#{params_protocol value}\n" }
      ret.chomp
    end

    def absolute_value(obj)
      "a\n#{obj}"
    end
  end
end
