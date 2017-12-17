describe Kraken::Connection do
  it 'get and set operations' do
    user = Faker::Cat.name
    pass = Faker::Crypto.sha256

    connection = Kraken::Connection.create(user: user, pass: pass)

    expect(connection.user).to eq user
    expect(connection.pass).to eq pass

    connection.delete
  end

  describe 'operations' do
    it '#single_user?' do
      user = Faker::Cat.name
      pass = Faker::Crypto.sha256

      connection1 = Kraken::Connection.create(user: user, pass: pass)
      expect(connection1.single_user?).to be true

      connection2 = Kraken::Connection.create(user: user, pass: pass)
      expect(connection1.single_user?).to be false

      connection1.delete
      connection2.delete
    end
  end
end
