class WeatherSerializer

  def initialize(info)
    @info = info
  end

  def serialize_weather
      {
        "data": {
          id: nil,
          type: "forecast",
          attributes: {
            current_weather: {
              last_updated: @info.current_weather[:last_updated],
              temperature: @info.current_weather[:temp_f],
              feels_like: @info.current_weather[:feelslike_f], 
              humidity: @info.current_weather[:humidity], 
              uvi: @info.current_weather[:uv], 
              visibility: @info.current_weather[:vis_miles], 
              condition: @info.current_weather[:condition][:text], 
              icon: @info.current_weather[:condition][:icon]
            }, 
            daily_weather: five_day_forecast,
            hourly_weather: today_hourly_weather 
          }
        }
      }

  end

  private 

  def five_day_forecast
    @info.daily_five_days.map do |day|
      {date: day[:date], 
      sunrise: day[:sun][:sunrise], 
      sunset: day[:sun][:sunset], 
      max_temp: day[:statistics][:maxtemp_f], 
      min_temp: day[:statistics][:mintemp_f], 
      condition: day[:statistics][:condition][:text],
      icon: day[:statistics][:condition][:icon] 
     }
    end
  end

  def today_hourly_weather
    @info.hourly_current_day.map do |hour|
      {
        time: parse_time(hour[:time]),
        temperature: hour[:temp_f],
        conditions: hour[:condition][:text], 
        icon: hour[:condition][:icon]
      }
    end
  end

  def parse_time(hour)
    hour.slice(11..-1)
  end
end
