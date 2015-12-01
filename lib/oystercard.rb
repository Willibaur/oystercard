class Oystercard

  attr_reader :balance, :amount, :entry_station
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."
  MIN_BALANCE_ERROR = "Not enough balance please top up!"
  MIN_BALANCE = 1
  FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail MAX_BALANCE_ERROR if check_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out
    deduct(FARE)
    @entry_station = nil
  end

  def in_journey?
    @entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end

end
