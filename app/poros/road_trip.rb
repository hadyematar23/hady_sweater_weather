class RoadTrip
  attr_reader :origin, 
              :destination, 
              :time 
  def initialize(origin, destination, time)
    @origin = origin
    @destination = destination
    @time = time 
  end
end