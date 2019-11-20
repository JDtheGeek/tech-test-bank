# frozen_string_literal: true

require 'date'
class Transaction
  attr_reader :date, :credit, :debit

  def initialize(amount:, date: Date.today)
    @date = date
    @credit = get_credit_value(amount)
    @debit = get_debit_value(amount)
  end

  private

  def get_credit_value(amount)
    amount.positive? ? amount : 0
  end

  def get_debit_value(amount)
    amount.negative? ? amount * -1 : 0
  end
end
