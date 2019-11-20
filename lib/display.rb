require 'date'

class Display

  HEADER = "date || credit || debit || balance \n"

  def self.print(statement)
    output = HEADER
    output += build_statement(statement.data)
    return output
  end

  private

  def self.build_statement(transactions)
    output = ''
    transactions.each do |hash|
      output += statement_line(
        date: hash[:date],
        credit: hash[:credit],
        debit: hash[:debit],
        balance: hash[:balance]
      )
    end
    return output
  end

  def self.statement_line(date:, credit:, debit:, balance:)
    date_string    = format_date(date)
    credit_string = format_value(credit)
    debit_string = format_value(debit)
    balance_string = format_value(balance)
    output = "#{date_string} ||#{ credit_string }||#{ debit_string }||#{ balance_string}\n"
    return output
  end

  def self.format_date(date)
    return date.strftime("%d/%m/%Y")
  end

  def self.format_value(value)
    return ' ' if value == 0
    string = format('%#.2f', value)
    string = " #{string} "
  end
end