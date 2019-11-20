# frozen_string_literal: true

require 'date'

class Statement
  def initialize(transactions, starting_balance = 0)
    @transactions = transactions
    @balance = starting_balance
  end

  def print
    output = default_header
    @transactions.each do |transaction|
      credit = transaction.amount if transaction.type == 'credit'
      debit = transaction.amount if transaction.type == 'debit'
      update_balance(credit, debit)
      output += statement_line(transaction.date, credit, debit, @balance)
    end
     puts output
     return output
  end

  private

  def update_balance(credit, debit)
    credit = 0 if credit.nil?
    debit = 0 if debit.nil?
    @balance += credit
    @balance -= debit
  end

  def default_header
    output =  "| date       |     credit |      debit |    balance |\n"
    output += "| :--------- | ---------: | ---------: | ---------: |\n"
    return output
  end

  def statement_line(date, credit, debit, balance)
    credit = 0 if credit.nil?
    debit = 0 if debit.nil?

    date_string    = format_date(date)
    credit_string = format_value(credit)
    debit_string = format_value(debit)
    balance_string = format_value(balance)
    output = "| #{date_string} | #{credit_string} | #{debit_string} | #{balance_string} |\n"
    return output
  end

  def format_date(date)
    return date.strftime('%d/%m/%Y')
  end

  def format_value(value)
    return '          ' if value.zero?
    string = format('%#.2f', value)
    return string.rjust(10,' ')
  end
end
