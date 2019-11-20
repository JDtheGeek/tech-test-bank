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

  let(:statement) {
    transactions = [transaction1, transaction2, transaction3]
    statement = Statement.new(transactions)
  }

  let(:record1) { statement.data[0] } # first line
  let(:record2) { statement.data[1] } # second line
  let(:record3) { statement.data[2] } # third line

  it 'shows a 500 withdrawel on 14/01/2012 on line 1' do
    expect(record1[:date]).to eq(Date.new(2012, 1, 14))
    expect(record1[:credit]).to eq 0
    expect(record1[:debit]).to eq 500
    expect(record1[:balance]).to eq 2500
  end

  it 'shows a 2000 debit on 13/01/2012 on line 2' do
    expect(record2[:date]).to eq(Date.new(2012, 1, 13))
    expect(record2[:credit]).to eq 2000
    expect(record2[:debit]).to eq 0
    expect(record2[:balance]).to eq 3000
  end

  it 'shows a 1000 debit on 10/01/2012 on line 3' do
    expect(record3[:date]).to eq(Date.new(2012, 1, 10))
    expect(record3[:credit]).to eq 1000
    expect(record3[:debit]).to eq 0
    expect(record3[:balance]).to eq 1000
  end

  context 'List of all transactions' do

    it 'appear in reverse order' do
      expect(record1[:date]).to eq(Date.new(2012,1,14))
      expect(record2[:date]).to eq(Date.new(2012,1,13))
      expect(record3[:date]).to eq(Date.new(2012,1,10))
    end

    it 'displays a rolling balance' do
      expect(record1[:balance]).to eq 2500
      expect(record2[:balance]).to eq 3000
      expect(record3[:balance]).to eq 1000
    end
  end
end
