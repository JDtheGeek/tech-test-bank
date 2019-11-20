# frozen_string_literal: true

require 'rspec'

describe Statement do
  let(:statement) do
    instance_double('Statement',
                    data: [
                      {
                        date: Date.new(2012, 1, 14),
                        credit: 0,
                        debit: 500,
                        balance: 2500
                      },
                      {
                        date: Date.new(2012, 1, 13),
                        credit: 2000,
                        debit: 0,
                        balance: 3000
                      },
                      {
                        date: Date.new(2012, 1, 10),
                        credit: 1000,
                        debit: 0,
                        balance: 1000
                      }
                    ])
  end

  it 'returns the correct format' do
    output = Display.print(statement)
    statement_string = "date || credit || debit || balance \n"
    statement_string += "14/01/2012 || || 500.00 || 2500.00 \n"
    statement_string += "13/01/2012 || 2000.00 || || 3000.00 \n"
    statement_string += "10/01/2012 || 1000.00 || || 1000.00 \n"

    expect(output).to eq statement_string
  end
end
