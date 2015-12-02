class Journey

  attr_reader :journey_log

  def initialize
    @journey_log = {}
    @single_journey = []
    @counter = 0
  end

  def start(entry_station)
    @entry_station = entry_station
    tracking
    @single_journey << @entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
    @single_journey << @exit_station
    journey_history
  end



  private

  def journey_history
    @journey_log[@counter] = @single_journey
    @single_journey = []
  end

  def tracking
    @counter += 1
  end

end
