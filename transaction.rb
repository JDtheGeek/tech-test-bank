
class Transaction

  attr_reader :amount, :transaction_type

  def initialize(amount:)
    @amount = amount
    check_transaction_type
  end

  private
  def check_transaction_type
    @transaction_type = 'credit' if amount > 0
    @transaction_type = 'debit' if amount < 0
  end

end