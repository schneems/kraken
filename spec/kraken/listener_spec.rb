describe Kraken::Listener do
  it 'receive tcp sockets' do
    listener = Kraken::Listener.new

    expect do
      @socket = TCPSocket.new 'localhost', 3030
    end.to_not raise_error

    @socket.close
    listener.close
  end
end
