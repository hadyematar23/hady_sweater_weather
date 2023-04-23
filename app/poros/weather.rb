class Weather 
  attr_reader :current_weather, 
              :daily_five_days, 
              :hourly_current_day, 
              :hourly_tomorrow
  def initialize(info)
    @current_weather = info[:current]
    @daily_five_days = info[:forecast][:forecastday].map do |day|
      {date: day[:date], statistics: day[:day], sun: day[:astro]}
    end
    @hourly_current_day = info[:forecast][:forecastday].first[:hour]
    @hourly_tomorrow = info[:forecast][:forecastday].second[:hour]
  end
end