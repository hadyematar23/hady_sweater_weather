class Api::V1::SalariesController < ApplicationController

  def index 
    coordinate = MapquestFacade.new.find_location_coordinates(params[:destination])
    forecast = WeatherFacade.new(coordinate).find_weather_five_days
    salary_info = TeleportFacade.new.find_salary_results(params[:destination])
    render json: ForecastSalariesSerializer.new.create_forecast_salary_json(params[:destination], forecast.current_weather, salary_info)
  end
end
