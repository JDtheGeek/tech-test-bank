require 'rspec'
require_relative '../transaction'

describe Transaction do
  it 'can be instantiated' do
    deposit = Transaction.new
    expect(deposit).to be_instance_of(Transaction)
  end
end