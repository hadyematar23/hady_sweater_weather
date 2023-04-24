class CurrentWeather
  attr_reader :location, 
              :current_weather
  def initialize(info)
    @location = info[:location]
    @current_weather = hash(info)
  end

  def hash(info)
    hash = {}
    hash[:temp] = info[:current][:temp_f]
    hash[:conditions] = info[:current][:condition][:text]
    return hash
  end
end