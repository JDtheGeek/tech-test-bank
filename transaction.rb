
class Transaction

  attr_reader :amount

  def initialize(amount:)
    @amount = amount
  end

  def transaction_type
    'deposit'
  end

end