class Api::V0::ForecastController < ApplicationController

  def index 
    coordinate = MapquestFacade.new(params[:location]).find_location_coordinates
    forecast = WeatherFacade.new(coordinate).find_weather_five_days
    render json: WeatherSerializer.new(forecast).serialize_weather
  end
end
