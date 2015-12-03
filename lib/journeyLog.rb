class JourneyLog

  attr_reader :journey_log

  def initialize
    @journey_log = {}
    @counter = 0
  end


  def journey_history(current_journey)
    tracking
    @journey_log[@counter] = current_journey
  end

  def tracking
    @counter += 1
  end
  
end
