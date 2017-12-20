require 'socket'

module Kraken
  class Client
    def initialize(user, pass)
      @user = user
      @pass = pass
    end

    def connect(host, port=3030)
      @socket = TCPSocket.new(host, port)
      @socket.puts @user
      @socket.puts @pass
    end

    def call(method, params)
      @socket.puts method.chomp
      @socket.puts params_protocol(params.chomp)
    end

    private

    def params_protocol(obj)
      case obj.class
      when Hash
        return "h\n#{obj.size}\n#{hash_protocol obj}"
      when Array
        return "v\n#{obj.size}\n#{vector_protocol obj}"
      when NilClass
        return "n"
      end
      absolute_value(obj)
    end

    def hash_protocol(obj)
      ret = ''
      obj.each_pair { |key, value| ret = ret+"#{key}\n#{params_protocol value}\n" }
      ret.chomp
    end

    def vector_protocol(obj)
      ret = ''
      obj.each { |value| ret = ret+"#{params_protocol value}\n"}
      ret.chomp
    end

    def absolute_value(obj)
      return "a\n#{obj}"
    end
  end
end
