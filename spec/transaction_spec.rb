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

  it "records the date of the transaction" do
    allow(Date).to receive(:today).and_return Date.new(2019,12,23)

    transaction = Transaction.new(amount: 100)
    expect(transaction.date).to eq Date.new(2019,12,23)
  end

  it "records date '28-02-2020 when passed that date upon creation " do
    current_date = Date.new(2020,2,28)
    transaction = Transaction.new(amount: 300, date: current_date)
    expect(transaction.date).to eq Date.new(2020,2,28)
  end

end