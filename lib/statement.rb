# frozen_string_literal: true

require 'date'

class Statement
  attr_reader :data

  def initialize(transactions, starting_balance = 0)
    @transactions = transactions
    @balance = starting_balance
    @data = []
    update_data
  end

  private

  def update_data
    @transactions.each do |transaction|
      update_balance(transaction.credit, transaction.debit)
      @data << {
        date: transaction.date,
        credit: transaction.credit,
        debit: transaction.debit,
        balance: @balance
      }
    end
    @data.reverse!
  end

  def update_balance(credit, debit)
    @balance += credit
    @balance -= debit
  end

end
