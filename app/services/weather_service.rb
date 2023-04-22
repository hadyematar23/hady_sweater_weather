class WeatherService 

  def get_current_weather_five_days(coordinate_info)
    get_url("forecast.json?q=#{coordinate_info[:lat]},#{coordinate_info[:lng]}&days=5")
  end

  def get_url(payload)
    response = connection.get(payload) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection 
    Faraday.new(url: "https://api.weatherapi.com/v1/") do |f|
      f.params["key"] = ENV['Weather_API']
    end
  end


end