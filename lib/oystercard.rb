require_relative 'journey'

class Oystercard

  attr_reader :balance, :amount, :journey
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."
  MIN_BALANCE_ERROR = "Not enough balance please top up!"
  MIN_BALANCE = 1
  FARE = 1
  FINE = 6

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    fail MAX_BALANCE_ERROR if check_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
    @entry_station = entry_station
    in_journey?(:in)
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    # deduct(fare(false)) if !in_journey?
    deduct(fare(:fare)) if !in_journey?
    @exit_station = exit_station
    @journey.end(@exit_station)
  end

  def in_journey?(status = nil)
    true if status == :in
  end

  def fare(condition)
    return FARE if condition == :fare
    return FINE if condition == :fine
  end

  private


  def deduct(amount)
    @balance -= amount
  end

  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end
end
