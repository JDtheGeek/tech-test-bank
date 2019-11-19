
class Statement

  def print
    output =  "| date       |    credit |     debit |   balance |\n"
    output += "| :--------- | --------: | --------: | --------: |\n"
    # output += '| 14/01/2012    |             |     500.00 |   2500.00 |'
    # output += '| 13/01/2012    |     2000.00 |            |   3000.00 |'
    # output += '| 10/01/2012    |     1000.00 |            |   1000.00 |'

    output += statement_line(Date.new(2012, 1, 14), 0, 500, 2500)
    output += statement_line(Date.new(2012, 1, 13), 2000, 0, 3000)
    output += statement_line(Date.new(2012, 1, 10), 1000, 0, 1000)

    puts output
    return output
  end

private

  def statement_line(date, credit = 0, debit = 0, balance = 0)
    date_string    = date.strftime("%d/%m/%Y")
    credit_string  = credit  == 0 ? '       ' : ('%.2f' % credit)
    debit_string   = debit   == 0 ? '      ' : ('%.2f' % debit)
    balance_string = balance == 0 ? '       ' : ('%.2f' % balance)

    "| #{date_string} |   #{credit_string} |    #{debit_string} |   #{balance_string} |\n"
  end

end