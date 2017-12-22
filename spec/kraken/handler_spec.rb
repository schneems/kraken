describe Kraken::Handler do
  class KrakenHandlerTest < Kraken::Trigger
    def run
      @@params = params unless params.nil?
      @@params = { a: 'b' } if params.nil?
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

    structure = { a: '2', b: '3', c: { a: '5' }, d: ['2', nil], k: nil }

    expect do
      @socket.puts 'krakenhandlertest'
      str = "h\n5\na\na\n2\nb\na\n3\nc\nh\n1\na\na\n5\nd\nv\n2\na\n2\nn\nk\nn"
      @socket.puts str
    end.to_not raise_error

    sleep 1

    expect(structure).to eq KrakenHandlerTest.resp
  end

  it 'can write nil' do
    Kraken::Config.instance.add_trigger klass: KrakenHandlerTest

    expect do
      @socket.puts Faker::Dune.planet
      @socket.puts Faker::Dune.planet
      @ok = @socket.gets.chomp
    end.to_not raise_error

    expect(@ok).to eq 'ok'

    structure = { a: 'b' }

    expect do
      @socket.puts 'krakenhandlertest'
      str = 'n'
      @socket.puts str
    end.to_not raise_error

    sleep 1

    expect(structure).to eq KrakenHandlerTest.resp
  end

  it 'can write []' do
    Kraken::Config.instance.add_trigger klass: KrakenHandlerTest

    expect do
      @socket.puts Faker::Dune.planet
      @socket.puts Faker::Dune.planet
      @ok = @socket.gets.chomp
    end.to_not raise_error

    expect(@ok).to eq 'ok'

    structure = []

    expect do
      @socket.puts 'krakenhandlertest'
      str = "v\n0"
      @socket.puts str
    end.to_not raise_error

    sleep 1

    expect(structure).to eq KrakenHandlerTest.resp
  end
end
