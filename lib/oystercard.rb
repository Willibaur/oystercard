class Oystercard

  attr_reader :balance, :amount, :status
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."
  MIN_BALANCE_ERROR = "Not enough balance please top up!"
  MIN_BALANCE = 1

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
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
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
