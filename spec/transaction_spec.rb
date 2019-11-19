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

  it 'records the amount 200 when instantiated with a 200' do
    deposit = Transaction.new(amount: 200)
    expect(deposit.amount).to eq 200
  end

  it 'records the amount -100 when instantiated with a -100' do
    deposit = Transaction.new(amount: -100)
    expect(deposit.amount).to eq -100
  end

  it "records type 'deposit' when a postive amount is passed" do
    transaction = Transaction.new(amount: 100)
    expect(transaction.transaction_type).to eq 'credit'
  end

  it "records type 'deposit' when a postive amount is passed" do
    transaction = Transaction.new(amount: 999)
    expect(transaction.transaction_type).to eq 'credit'
  end

  it "records type 'withdrawel' when a negative amount is passed" do
    transaction = Transaction.new(amount: -100)
    expect(transaction.transaction_type).to eq 'debit'
  end

end