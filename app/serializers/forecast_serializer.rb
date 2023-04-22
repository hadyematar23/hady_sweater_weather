class ForecastSerializer
  def initialize(forecast)
    @forecast = forecast
  end

  def serialize_forecast
    {
      "data": {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            last_updated: @forecast[:current][:last_updated],
            temperature: @forecast[:current][:temp_f],
            feels_like: @forecast[:current][:feelslike_f], 
            humidity: @forecast[:current][:humidity], 
            uvi: @forecast[:current][:uv], 
            visibility: @forecast[:current][:vis_miles], 
            condition: @forecast[:current][:condition][:text], 
            icon: @forecast[:current][:condition][:icon]
          }, 
          daily_weather: five_day_forecast,
          hourly_weather: today_hourly_weather 
        }
      }
    }
  end

  private 

  def five_day_forecast
    @forecast[:forecast][:forecastday].map do |day|
      {date: day[:date], 
      sunrise: day[:astro][:sunrise], 
      sunset: day[:astro][:sunset], 
      max_temp: day[:day][:maxtemp_f], 
      min_temp: day[:day][:mintemp_f], 
      condition: day[:day][:condition][:text],
      icon: day[:day][:condition][:icon] 
     }
    end
  end

  def today_hourly_weather
    @forecast[:forecast][:forecastday].first[:hour].map do |hour|
      {
        time: parse_time(hour),
        temperature: hour[:temp_f],
        conditions: hour[:condition][:text], 
        icon: hour[:condition][:icon]
      }
    end
  end

  def parse_time(hour)
    hour[:time].slice(11..-1)
  end
end
