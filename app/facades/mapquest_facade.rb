class MapquestFacade

  def find_location_coordinates(location)
    @service = MapquestService.new
    coordinates = @service.get_coordinates(location)
  end

  def driving_directions(origin, destination)
    @service = MapquestDrivingService.new
    directions = @service.get_directions(origin, destination)
    RoadTrip.new(origin, destination, directions)
  end

  
end