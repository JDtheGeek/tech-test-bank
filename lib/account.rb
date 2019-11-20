# frozen_string_literal: true

require 'date'
require_relative './statement'
require_relative './transaction'
require_relative './display'

class Account
  attr_reader :balance

  def initialize(opening_balance: 0)
    @balance = opening_balance
    @transactions = []
  end

  def transaction(amount:, date: Date.today)
    transaction = Transaction.new(amount: amount, date: date)
    @transactions << transaction
    @balance += amount
  end

  def statement
    statement = Statement.new(@transactions)
    Display.print(statement)
  end
end
