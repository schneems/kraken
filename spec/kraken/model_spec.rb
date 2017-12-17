describe Kraken::Model do
  it 'set and get attr' do
    obj = Kraken::Model.new 'player/itens'

    obj['hehe'] = 'haha'
    obj['haha'] = 'hehe'

    expect(obj['hehe']).to eq 'haha'
    expect(obj['haha']).to eq 'hehe'
  end
end
