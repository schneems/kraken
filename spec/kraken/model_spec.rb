describe Kraken::Model do
  it 'set and get attr' do
    attr_key1 = Faker::Coffee.blend_name
    attr_key2 = Faker::Coffee.blend_name

    obj = Kraken::Model.new 'coffe/blend_name'

    obj['attr_key1'] = attr_key1
    obj['attr_key2'] = attr_key2

    expect(obj['attr_key1']).to eq attr_key1
    expect(obj['attr_key2']).to eq attr_key2
  end

  it 'can del a attr' do
    obj = Kraken::Model.new 'player/map'

    map_name = Faker::ElderScrolls.region
    obj['name'] = map_name
    obj.del 'name'

    expect(obj['name']).to_not eq map_name
  end
end
