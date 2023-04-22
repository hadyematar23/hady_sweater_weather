class MapquestFacade

  def initialize(location)
    @location = location 
    @service = MapquestService.new
  end

  def find_location_coordinates
    coordinates = @service.get_coordinates(@location)
  end
end