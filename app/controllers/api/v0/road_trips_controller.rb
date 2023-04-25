class Api::V0::RoadTripsController < ApplicationController
  wrap_parameters :road_trip, include: [:origin, :destination, :api_key]
  
  def create

    if user == nil #user info false- errors out. no road trip can be made. 
      render json: ErrorSerializer.new.no_api_key, status: 401

    elsif directions.time != nil #it is possible to drive it 

      if hours_from_midnight_of_current_day_to_query <= 119 #hourly weather forecast possible 
        weather = determine_weather(hours_from_midnight_of_current_day_to_query, weather_info_for_destination) 
        render json: DestinationSerializer.new.serialize_destination_weather(params[:road_trip][:origin], params[:road_trip][:destination], directions.time, weather)

      elsif hours_from_midnight_of_current_day_to_query > 119 #hourly forecast not possible 
        render json: DestinationSerializer.new.serialize_destination_weather_error_trip_too_long(params[:road_trip][:origin], params[:road_trip][:destination], directions.time.split(":").first.to_i)
        
      end

    else #impossible to drive it (i.e. NYC to London)
      render json: DestinationSerializer.new.serialize_destination_weather_error(params[:road_trip][:origin], params[:road_trip][:destination])
    end 
  end

  private 

  def user 
    User.find_by(api_key: params[:road_trip][:api_key])
  end

  def directions
    @directions ||= MapquestFacade.new.driving_directions(params[:road_trip][:origin], params[:road_trip][:destination])
  end

  def weather_info_for_destination
    @weather_info ||= get_weather_info(params[:road_trip][:destination]) 
  end

  def local_time_in_destination
    weather_info_for_destination.location[:localtime]
  end

  def get_weather_info(destination)
    coordinates_hash = MapquestFacade.new.find_location_coordinates(destination)
    weather_info_for_destination = WeatherFacade.new(coordinates_hash).find_weather_five_days
  end

  def hours_from_midnight_of_current_day_to_query
    round_hour(directions.time) + round_time(local_time_in_destination[10..-1])
  end

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
    end
  end

  def round_hour(time)
    if time 
      if time.split(":").second.to_i >= 30 
        time.split(":").first.to_i + 1
      else
        time.split(":").first.to_i
      end
    end 
  end

  def round_time(datetime)
    if datetime
      split = datetime.split(":")
      if split.second.to_i >= 30 
        split.first.to_i + 1
      else 
        split.first.to_i
      end
    end 
  end

end
