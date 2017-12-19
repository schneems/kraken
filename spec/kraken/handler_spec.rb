describe Kraken::Handler do

  class KrakenHandlerTest < Kraken::Trigger
    def run
      @@params = params
    end

    def self.resp
      @@params
    end
  end

  before do
    @listener = Kraken::Listener.new
    @socket = TCPSocket.new 'localhost', 3030
  end

  after do
    @socket.close
    @listener.close
  end

  it 'can connect' do
    expect do
      @socket.puts Faker::Dune.planet
      @socket.puts Faker::Dune.planet
      @ok = @socket.gets.chomp
    end.to_not raise_error

    expect(@ok).to eq 'ok'
  end

  it 'can write a complex structure to a param' do
    Kraken::Config.instance.add_trigger klass: KrakenHandlerTest

    expect do
      @socket.puts Faker::Dune.planet
      @socket.puts Faker::Dune.planet
      @ok = @socket.gets.chomp
    end.to_not raise_error

    expect(@ok).to eq 'ok'

    structure = { a: '2', b: '3', c: { a: '5' }, d: ['2',nil], k: nil }

    expect do
      @socket.puts 'krakenhandlertest'

      @socket.puts 'h'
        @socket.puts '5'
          @socket.puts 'a'
            @socket.puts 'a'
              @socket.puts '2'
          @socket.puts 'b'
            @socket.puts 'a'
              @socket.puts '3'
          @socket.puts 'c'
            @socket.puts 'h'
              @socket.puts '1'
            @socket.puts 'a'
              @socket.puts 'a'
                @socket.puts '5'
          @socket.puts 'd'
            @socket.puts 'v'
              @socket.puts '2'
                @socket.puts 'a'
                  @socket.puts '2'
                @socket.puts 'n'
          @socket.puts 'k'
            @socket.puts 'n'
    end.to_not raise_error

    sleep 1

    expect(structure).to eq KrakenHandlerTest.resp
  end
end
