require_relative 'journeyLog'

class Journey

  attr_reader :single_journey, :in_use, :journeyLog

  def initialize
    @single_journey = []
    @journeyLog = JourneyLog.new
    @in_use = false
  end

  def start(entry_station)
    if in_journey?
      current_journey(nil)
      store_and_wipe_journey
    end
    @in_use = true
    current_journey(entry_station)
  end


  def end(exit_station)
    current_journey(nil) if !in_journey?
    @in_use = false
    current_journey(exit_station)
    store_and_wipe_journey
  end



  private

  def store_and_wipe_journey
    @journeyLog.journey_history(@single_journey)
    @single_journey = []
  end

  def in_journey?
    @in_use
  end

  def current_journey(station)
    @single_journey << station
  end

end
