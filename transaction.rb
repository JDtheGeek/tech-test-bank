
class Transaction

  attr_reader :amount

  def initialize(amount:)
    @amount = amount
    @
  end

  private
  def transaction_type
    return 'credit' if amount > 0
    return 'debit' if amount < 0
  end

end