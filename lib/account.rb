# frozen_string_literal: true

require 'date'
require_relative './statement'
require_relative './transaction'


class Account
  attr_reader :balance

  def initialize(opening_balance: 0)
    @balance = opening_balance
    @transactions = []
  end

  def transaction(amount: 0, date: Date.today)
    @balance += amount
    new_transaction = Transaction.new(amount: amount, date: date)
    @transactions << new_transaction
  end

  def statement
    new_statement = Statement.new(@transactions)
    new_statement.print
  end
end
