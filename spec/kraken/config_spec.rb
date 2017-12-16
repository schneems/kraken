describe Kraken::Config do
  it 'setup the server instance' do
    Kraken::Config.instance.setup do |config|
      config.server name: 'hehe', token: 't1', version: 'v1'
    end

    expect(Kraken::Config.instance.server_name).to eq 'hehe'
    expect(Kraken::Config.instance.server_token).to eq 't1'
    expect(Kraken::Config.instance.server_version).to eq 'v1'
  end

  describe 'setup the trigger instance' do
    it 'setup a trigger' do
      Kraken::Config.instance.setup do |config|
        config.add_trigger klass: Kraken::Trigger
      end

      expect(Kraken::Config.instance.triggers['kraken::trigger']).to eq Kraken::Trigger
    end

    it 'run exception if class does not inherit a trigger' do
      expect do
        Kraken::Config.instance.setup do |config|
          config.add_trigger klass: String
        end
      end.to raise_error('Klass needs to inherit Kraken::Trigger')
    end
  end
end
