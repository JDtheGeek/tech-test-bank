# frozen_string_literal: true

require 'date'
class Transaction
  attr_reader :amount, :transaction_type, :date

  def initialize(amount:, date: Date.today)
    @amount = amount
    @date = date
    check_transaction_type
  end

  private

  def check_transaction_type
    @transaction_type = 'credit' if amount.positive?
    @transaction_type = 'debit' if amount.negative?
  end
end
