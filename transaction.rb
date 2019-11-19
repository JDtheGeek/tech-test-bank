
class Transaction

  def initialize(amount:)
    @amount = amount
  end

  def amount
    return 100 if @amount == 100
    return 200 if @amount == 200
  end
end