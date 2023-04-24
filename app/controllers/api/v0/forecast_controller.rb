class Api::V0::ForecastController < ApplicationController

  def index 
    cache_key = "api_call_result_#{params[:location]}"
    
    result = Rails.cache.fetch(cache_key, expires_in: 1.hour) do 
      coordinate = MapquestFacade.new.find_location_coordinates(params[:location])
    end 
    forecast = WeatherFacade.new(result).find_weather_five_days
    render json: WeatherSerializer.new(forecast).serialize_weather
  end
end
