class Weather 
  attr_reader :current_weather, 
              :daily_five_days, 
              :hourly_current_day, 
              :hourly_tomorrow, 
              :hourly_two_tomorrow,
              :hourly_three_tomorrow, 
              :hourly_four_tomorrow,
              :location
  def initialize(info)
    @location = info[:location]
    @current_weather = info[:current]
    @daily_five_days = info[:forecast][:forecastday].map do |day|
      {date: day[:date], statistics: day[:day], sun: day[:astro]}
    end
    @hourly_current_day = info[:forecast][:forecastday].first[:hour]
    @hourly_tomorrow = info[:forecast][:forecastday].second[:hour]
    @hourly_two_tomorrow = info[:forecast][:forecastday].third[:hour]
    @hourly_three_tomorrow = info[:forecast][:forecastday].fourth[:hour]
    @hourly_four_tomorrow = info[:forecast][:forecastday].fifth[:hour]
  end
end