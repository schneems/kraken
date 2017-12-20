describe Kraken::Client do
  class KrakenClientTest < Kraken::Trigger
    def run
      @@params = params
    end

    def self.resp
      @@params
    end
  end

  before do
    @listener = Kraken::Listener.new
    @client = Kraken::Client.new Faker::Ancient.god, Faker::Ancient.god
  end

  after do
    @client.close
    @listener.close
  end

  it 'can connect' do
    expect do
      @client.connect 'localhost'
    end.to_not raise_error
  end

  it 'can call a complex param' do
    Kraken::Config.instance.add_trigger klass: KrakenClientTest

    expect do
      @client.connect 'localhost'
    end.to_not raise_error

    @structure = { a: '2', b: '3', c: { a: '5' }, d: ['2', nil], k: nil }

    expect do
      @client.call 'KrakenClientTest', @structure
    end.to_not raise_error

    sleep 1

    expect(@structure).to eq KrakenClientTest.resp
  end
end
