class Api::V0::RoadTripsController < ApplicationController
  wrap_parameters :road_trip, include: [:origin, :destination, :api_key]
  
  def create
    user = User.find_by(api_key: params[:road_trip][:api_key])
    if user == nil
      render json: ErrorSerializer.new.no_api_key, status: 401
    else 
      coordinates_hash = MapquestFacade.new.find_location_coordinates(params[:road_trip][:destination])
      weather_info_for_destination = WeatherFacade.new(coordinates_hash).find_weather_five_days
      directions = MapquestFacade.new.driving_directions(params[:road_trip][:origin], params[:road_trip][:destination])

      if directions.time != nil 
        hour_variable = directions.time.chars[0..1].join.to_i
        local_time_in_destination = weather_info_for_destination.location[:localtime]
        current_hour_in_destination = local_time_in_destination[10..-4].to_i
        hour_number = hour_variable + current_hour_in_destination
        
        weather = determine_weather(hour_number, weather_info_for_destination) 

        render json: DestinationSerializer.new.serialize_destination_weather(params[:road_trip][:origin], params[:road_trip][:destination], directions.time, weather)
      else 
        render json: DestinationSerializer.new.serialize_destination_weather_error(params[:road_trip][:origin], params[:road_trip][:destination])
      end 
    end 
  end

  private 

  def determine_weather(hour_number, weather_info_for_destination) 
    if hour_number <= 23 
      weather_info_for_destination.hourly_current_day[hour_number]
    elsif hour_number >= 24 && hour_number <=47
      weather_info_for_destination.hourly_tomorrow[hour_number-24]
    elsif hour_number >= 48 && hour_number <=71
      weather_info_for_destination.hourly_two_tomorrow[hour_number-48]
    elsif hour_number >= 72 && hour_number <=95
      weather_info_for_destination.hourly_three_tomorrow[hour_number-72]
    elsif hour_number >= 96 && hour_number <=119
      weather_info_for_destination.hourly_four_tomorrow[hour_number-96]
    else 
      # Arrange Error Handling here 
    end
  end
end
