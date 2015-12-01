class Oystercard

  attr_reader :balance, :amount, :status
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    fail MAX_BALANCE_ERROR if check_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end

  def in_journey?
    @status
  end

  private

  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end

end
