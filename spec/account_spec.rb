require 'rspec'
require 'account'

describe Account do
  it 'new account has a balance of 0' do
    account = Account.new
    expect(account.balance).to eq 0
  end

  it 'account can return current balance' do
    account = Account.new(opening_balance: 100)
    expect(account.balance).to eq 100
  end

  it 'returns balance of 100 after deposit of 100' do
    account = Account.new
    account.transaction(amount: 100)
    expect(account.balance).to eq 100
  end

  it 'returns balance of 500 after deposit of 500' do
    account = Account.new
    account.transaction(amount: 500)
    expect(account.balance).to eq 500
  end

  it 'can send generate a statement showing debit on 10/01/2012' do
    statement_header = '| date          |      credit |      debit |   balance |'
    account = Account.new
    account.transaction(amount: 1_000, date: Date.new(2012,1,10))
    expect(account.statement).to include(statement_header)
    expect(account.statement).to include('| 10/01/2012')
    expect(account.statement).to include('1000.00 |') # deposit

    expect(account.statement).not_to include('| 13/01/2012')
  end

  it 'can send generate a statement showing debit on 13/01/2012' do
    statement_header = '| date          |      credit |      debit |   balance |'
    account = Account.new
    account.transaction(amount: 2_000, date: Date.new(2012,1,13))
    expect(account.statement).to include(statement_header)
    expect(account.statement).to include('| 13/01/2012')
    expect(account.statement).to include('2000.00 |') # deposit

    expect(account.statement).not_to include('| 10/01/2012')
  end

  it 'can send generate a statement showing withdrawel on 14/01/2012' do
    statement_header = '| date          |      credit |      debit |   balance |'
    account = Account.new
    account.transaction(amount: -500, date: Date.new(2012,1,14))
    expect(account.statement).to include(statement_header)
    expect(account.statement).to include('| 14/01/2012')
    expect(account.statement).to include('500.00 |') # withdrawel

    expect(account.statement).not_to include('| 10/01/2012')
  end

end