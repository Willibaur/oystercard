class Oystercard

  attr_reader :balance, :amount, :journey
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."
  MIN_BALANCE_ERROR = "Not enough balance please top up!"
  MIN_BALANCE = 1
  FARE = 1

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
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(FARE)
    @exit_station = exit_station
    @journey.end(@exit_station)
  end

  def in_journey?
    @entry_station
  end


  private

  # def new_instance
  #   Journey.new
  # end

  def deduct(amount)
    @balance -= amount
  end

  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end
end
