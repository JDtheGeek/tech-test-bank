# frozen_string_literal: true

require 'rspec'
require 'statement'

describe Statement do
  let(:transaction1) {instance_double(
    'Transaction',
    date:   Date.new(2012, 1, 10),
    credit: 1000,
    debit: 0
  )}
  let(:transaction2) {instance_double(
    'Transaction',
    date:   Date.new(2012, 1, 13),
    credit: 2000,
    debit: 0
  )}
  let(:transaction3) {instance_double(
    'Transaction',
    date:   Date.new(2012, 1, 14),
    credit: 0,
    debit: 500
  )}
  let(:transactions) {[transaction1, transaction2, transaction3]}

  it 'can send generate a statement showing a 1000 debit on 10/01/2012' do
    statement = Statement.new([transaction1])
    record = statement.data[0]
    expect(record[:date]).to eq(Date.new(2012, 1, 10))
    expect(record[:credit]).to eq 1000
    expect(record[:debit]).to eq 0
    expect(record[:balance]).to eq 1000
  end

  it 'can send generate a statement showing a 2000 debit on 13/01/2012' do
    statement = Statement.new([transaction2])
    record = statement.data[0]
    expect(record[:date]).to eq(Date.new(2012, 1, 13))
    expect(record[:credit]).to eq 2000
    expect(record[:debit]).to eq 0
    expect(record[:balance]).to eq 2000
  end

  it 'can send generate a statement showing a 500 withdrawel on 14/01/2012' do
    statement = Statement.new([transaction3])
    record = statement.data[0]
    expect(record[:date]).to eq(Date.new(2012, 1, 14))
    expect(record[:credit]).to eq 0
    expect(record[:debit]).to eq 500
    expect(record[:balance]).to eq(-500)
  end

  # context 'List of all transactions' do
  #   before(:all) do
  #     transactions = []
  #     transactions << {
  #       date:   Date.new(2012, 1, 10),
  #       credit: 1000,
  #       debit: 0
  #     }

  #     Statement.new(transactions)
  #     @record1 = statement.data[0]
  #     @record2 = statement.data[1]
  #     @record3 = statement.data[2]
  #   end

  #   it 'appear in reverse order' do
  #     expect(@record1[:date]).to eq(Date.new(2012,1,14))
  #     expect(@record2[:date]).to eq(Date.new(2012,1,13))
  #     expect(@record3[:date]).to eq(Date.new(2012,1,10))
  #   end

  #   it 'displays a rolling balance' do
  #     expect(@record1[:balance]).to eq 2500
  #     expect(@record2[:balance]).to eq 3000
  #     expect(@record3[:balance]).to eq 1000
  #   end
  # end
end
