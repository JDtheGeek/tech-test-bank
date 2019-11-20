# frozen_string_literal: true

require 'rspec'
require 'transaction'

describe Transaction do
  it 'records the amount 100 when instantiated with a 100' do
    transaction = Transaction.new(amount: 100)
    expect(transaction.credit).to eq 100
    expect(transaction.debit).to eq 0
  end

  it 'records the amount 200 when instantiated with a 200' do
    transaction = Transaction.new(amount: 200)
    expect(transaction.credit).to eq 200
    expect(transaction.debit).to eq 0
  end

  it 'records the amount -100 when instantiated with a -100' do
    transaction = Transaction.new(amount: -100)
    expect(transaction.credit).to eq 0
    expect(transaction.debit).to eq 100
  end

  it 'records the date of the transaction' do
    allow(Date).to receive(:today).and_return Date.new(2019, 12, 23)

    transaction = Transaction.new(amount: 100)
    expect(transaction.date).to eq Date.new(2019, 12, 23)
  end

  it "records date '28-02-2020 when passed that date upon creation " do
    current_date = Date.new(2020, 2, 28)
    transaction = Transaction.new(amount: 300, date: current_date)
    expect(transaction.date).to eq Date.new(2020, 2, 28)
  end
end
