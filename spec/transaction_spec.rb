require 'rspec'

describe Transaction do
  it 'can be instantiated' do
    deposit = Transaction.new
    expect(deposit).to be_type_of(Transaction)
  end
end