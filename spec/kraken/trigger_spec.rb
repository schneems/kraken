describe Kraken::Trigger do
  it 'can view params and connection' do
    trigger = Kraken::Trigger.new 'conn', ['haha','hehe','hihi']

    expect(trigger.conn).to eq 'conn'
    expect(trigger.params[0]).to eq 'haha'
    expect(trigger.params[1]).to eq 'hehe'
    expect(trigger.params[2]).to eq 'hihi'
  end
end
