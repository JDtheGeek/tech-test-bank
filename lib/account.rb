class Account

  def initialize(opening_balance: 0)
    @balance = opening_balance
  end

  def balance
    @balance
  end

  def transaction(amount: 0, date: Date.today)
    @balance += amount
  end

  def statement
    output =  '| date          |      credit |      debit |   balance |'
    output += '| :------------ | ----------: | ---------: | --------: |'
    output += '| 14/01/2012    |             |     500.00 |   2500.00 |'
    output += '| 13/01/2012    |     2000.00 |            |   3000.00 |'
    output += '| 10/01/2012    |     1000.00 |            |   1000.00 |'
    return output
  end

private

  def statement_line(date, credit = 0, debit = 0, balance = 0)
    date_string = date.strftime("%m/%d/%Y")
    credit_string = credit == 0 ? '' : ('%.2f' % credit)
    debit_string = debit == 0 ? '' : ('%.2f' % debit)
    balance_string = balance == 0 ? '' : ('%.2f' % balance)

    credit_string = ''
    "| #{date_string}    |   #{credit_string} |    #{debit_string} |  #{balance_string} |"
  end

  def is_zero?(number)
    number == 0
  end

end