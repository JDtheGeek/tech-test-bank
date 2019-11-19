# frozen_string_literal: true

require 'date'
require 'statement'
require 'transaction'

class Account
  def initialize(opening_balance: 0)
    @balance = opening_balance
  end

  attr_reader :balance

  def transaction(amount: 0, date: Date.today)
    @balance += amount
  end

  def statement; end
end
