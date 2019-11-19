# frozen_string_literal: true

require 'rspec'
require 'statement'

describe Statement do
  let(:header) { '| date       |    credit |     debit |   balance |' }
  it 'can send generate a statement showing debit on 10/01/2012' do
    statement = Statement.new
    print_out = statement.print
    expect(print_out).to include(header)
    expect(print_out).to include('| 10/01/2012')
    expect(print_out).to include('1000.00 |') # deposit

    # expect(print_out).not_to include('| 13/01/2012')
  end

  it 'can send generate a statement showing debit on 13/01/2012' do
    statement = Statement.new
    print_out = statement.print
    expect(print_out).to include(header)
    expect(print_out).to include('| 13/01/2012')
    expect(print_out).to include('2000.00 |') # deposit

    # expect(print_out).not_to include('| 10/01/2012')
  end

  it 'can send generate a statement showing withdrawel on 14/01/2012' do
    statement = Statement.new
    print_out = statement.print
    expect(print_out).to include(header)
    expect(print_out).to include('| 14/01/2012')
    expect(print_out).to include('500.00 |') # withdrawel

    # expect(print_out).not_to include('| 10/01/2012')
  end
end
