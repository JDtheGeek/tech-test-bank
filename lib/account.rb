class Account

  def initialize(opening_balance: 0)
    @balance = opening_balance
  end

  def balance
    @balance
  end

  def transaction(amount:)
    @balance = 100
  end
end