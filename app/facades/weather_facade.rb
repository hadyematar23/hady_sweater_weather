class WeatherFacade
  def initialize(coordinate_info)
    @coordinate_info = coordinate_info
    @service = WeatherService.new
  end

  def find_weather_five_days 
    response = @service.get_current_weather_five_days(@coordinate_info)
    weather_object = Weather.new(response)
  end
end