# require_relative 'journey'

class Oystercard

  attr_reader :balance, :amount
  DEFAULT_LIMIT = 90
  MAX_BALANCE_ERROR = "Maximum balance £#{DEFAULT_LIMIT} exceeded."
  MIN_BALANCE_ERROR = "Not enough balance please top up!"
  MIN_BALANCE = 1
  FARE = 1

  def initialize
    @balance = 0
    # @journeys = {}
    # @single_journey = []
    # @counter = 0
  end

  def top_up(amount)
    fail MAX_BALANCE_ERROR if check_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
    @entry_station = entry_station
    @journey = new_instance
    @journey.start(@entry_station)
    # tracking
    # @single_journey << @entry_station
  end

  def touch_out(exit_station)
    deduct(FARE)
    @exit_station = exit_station
    @journey.end(@exit_station)
    # @single_journey << @exit_station
    # journey_log
  end

  def in_journey?
    @entry_station
  end




  private

  def new_instance
    Journey.new
  end

  def deduct(amount)
    @balance -= amount
  end

  def check_limit?(amount)
    amount > (DEFAULT_LIMIT - @balance)
  end

  # def journey_log
  #   @journeys[@counter] = @single_journey
  #   @single_journey = []
  # end

  # def tracking
  #   @counter += 1
  # end

end
