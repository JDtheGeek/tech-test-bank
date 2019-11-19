require 'rspec'
require_relative '../transaction'

describe Transaction do
  # it 'can be instantiated' do
  #   deposit = Transaction.new
  #   expect(deposit).to be_instance_of(Transaction)
  # end

  it 'records the amount 100 when instantiated with a 100' do
    deposit = Transaction.new(amount: 100)
    expect(deposit.amount).to eq 100
  end

  it 'records the amount 100 when instantiated with a 100' do
    deposit = Transaction.new(amount: 200)
    expect(deposit.amount).to eq 200
  end


end