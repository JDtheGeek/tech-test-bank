
class Transaction

  attr_reader :amount

  def initialize(amount:)
    @amount = amount
  end

  def transaction_type
    return 'deposit' if amount > 0
    return 'withdrawel' if amount < 0
  end

end