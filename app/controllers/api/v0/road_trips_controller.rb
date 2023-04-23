class Api::V0::RoadTripsController < ApplicationController
  wrap_parameters :road_trip, include: [:origin, :destination, :api_key]
  def create
    #extract weather info 
    # VCR.turned_off do
    #   WebMock.allow_net_connect!
      coordinates_hash = MapquestFacade.new(params[:road_trip][:destination]).find_location_coordinates
      x = WeatherFacade.new(coordinates_hash).find_weather_five_days
    #   WebMock.disable_net_connect!
    # end
  end
end
