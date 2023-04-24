class Api::V1::SalariesController < ApplicationController

  def index 
    coordinate = MapquestFacade.new.find_location_coordinates(params[:destination])
    # require 'pry'; binding.pry
    forecast = WeatherFacade.new(coordinate).find_weather_five_days
    # require 'pry'; binding.pry
    salary_info = TeleportFacade.new.find_salary_results(params[:destination])

    # https://api.teleport.org/api/urban_areas/slug:chicago/salaries/
  end
end
