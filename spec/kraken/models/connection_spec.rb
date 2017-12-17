describe Kraken::Connection do
  it 'get and set operations' do
    user = Faker::Cat.name
    pass = Faker::Crypto.sha256

    connection = Kraken::Connection.create(user: user, pass: pass)

    expect(connection.user).to eq user
    expect(connection.pass).to eq pass

    connection.delete
  end
end
