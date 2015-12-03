require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."
  MIN_BALANCE_ERROR = "Not enough balance please top up!"
  MIN_BALANCE = 1
  FARE = 1
  FINE = 6

  def initialize
    @balance = 0
    @journey = Journey.new
    @in_use = false
  end

  def top_up(amount)
    fail MAX_BALANCE_ERROR if check_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    deduct(FINE) if in_journey?
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
    @in_use = true
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    @journey.end(exit_station)
    deduct(fare)
    @in_use = false
  end





  private


  def fare
    @in_use ? FARE : FINE
  end

  def in_journey?
    @in_use
  end

  def deduct(amount)
    @balance -= amount
  end

  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end
end
