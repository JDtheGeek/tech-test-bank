# require 'rspec'
# require 'display'

# describe Display do
#   let(:header) { '| date       |     credit |      debit |    balance |' }
#   let(:transaction1) {instance_double(
#     'Transaction',
#     amount: 1000,
#     type:   'credit',
#     date:   Date.new(2012, 1, 10)
#   )}
#   let(:transaction2) {instance_double(
#     'Transaction',
#     amount: 2000,
#     type:   'credit',
#     date:   Date.new(2012, 1, 13)
#   )}
#   let(:transaction3) {instance_double(
#     'Transaction',
#     amount: 500,
#     type:   'debit',
#     date:   Date.new(2012, 1, 14)
#   )}

#   it 'can send generate a statement showing debit on 10/01/2012' do
#     transaction_data = [transaction1]
#     statement = Statement.new(transaction_data)
#     print_out = statement.print
#     expect(print_out).to include(header)
#     expect(print_out).to include('| 10/01/2012')
#     expect(print_out).to include('1000.00 |') # deposit
#   end

#   it 'can send generate a statement showing debit on 13/01/2012' do
#     transaction_data = [transaction2]
#     statement = Statement.new(transaction_data)
#     print_out = statement.print
#     expect(print_out).to include(header)
#     expect(print_out).to include('| 13/01/2012')
#     expect(print_out).to include('2000.00 |') # deposit
#     expect(print_out).not_to include('| 10/01/2012')
#   end

#   it 'can send generate a statement showing withdrawel on 14/01/2012' do
#     transaction_data = [transaction3]
#     statement = Statement.new(transaction_data)
#     print_out = statement.print
#     expect(print_out).to include(header)
#     expect(print_out).to include('| 14/01/2012')
#     expect(print_out).to include('500.00 |') # withdrawel
#     expect(print_out).not_to include('| 10/01/2012')
#   end

#   # it 'can show the correct balance' do
#   it 'can send generate a statement showing withdrawel on 14/01/2012' do
#     transaction_data = [transaction1,transaction2,transaction3]
#     statement = Statement.new(transaction_data)
#     print_out = statement.print

#     statement  = "| date       |     credit |      debit |    balance |\n"
#     statement += "| :--------- | ---------: | ---------: | ---------: |\n"
#     statement += "| 20/11/2019 |    1000.00 |            |    1000.00 |\n"
#     statement += "| 20/11/2019 |    1500.00 |            |    2500.00 |\n"
#     statement += "| 20/11/2019 |            |    -900.00 |    3400.00 |\n"
#     statement += "| 20/11/2019 |            |     -50.00 |    3450.00 |\n"
#     statement += "| 20/11/2019 |     250.00 |            |    3700.00 |\n"

#     expect(print_out).to eq(statement)

#   end

#   # end
# end