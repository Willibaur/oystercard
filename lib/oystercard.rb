class Oystercard

  attr_reader :balance, :amount
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail MAX_BALANCE_ERROR if check_limit?(amount)
    @balance += amount
  end



  private


  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end

end
