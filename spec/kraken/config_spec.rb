describe Kraken::Config do
  it 'setup the server instance' do
    Kraken::Config.instance.setup do |config|
      config.server name: 'hehe', token: 't1', version: 'v1'
    end

    expect(Kraken::Config.instance.server_name).to eq 'hehe'
    expect(Kraken::Config.instance.server_token).to eq 't1'
    expect(Kraken::Config.instance.server_version).to eq 'v2'
  end
end
