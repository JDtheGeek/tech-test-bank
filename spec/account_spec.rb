# frozen_string_literal: true

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

end
