require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe "the Weather PORO " do
    before(:each) do 
      info = {
              current: {
                last_updated: "2023-04-22 20:00", 
                temp_f: 75.9,
                condition: {text:
                  "Patchy light rain with thunder", 
                  icon: "//cdn.weatherapi.com/weather/64x64/night/386.png", 
                  code: 1273
                }
              }, 
              forecast: {forecastday: [
                {date: "day1", day: "dayinfo1", astro: {sunset: "now", sunrise: "later"}, hour: [{time: "time1", details: "details1"},{time: "time2", details: "details2"}]}, 
                {date: "day2", day: "dayinfo2", astro: {sunset: "now", sunrise: "later"}, hour: [{time: "time3", details: "details3"},{time: "time4", details: "details4"}]}, 
                {date: "day3", day: "dayinfo3", astro: {sunset: "now", sunrise: "later"}, hour: [{time: "time5", details: "details5"},{time: "time6", details: "details6"}]}, 
                {date: "day4", day: "dayinfo4", astro: {sunset: "now", sunrise: "later"}, hour: [{time: "time7", details: "details7"},{time: "time8", details: "details8"}]},
                {date: "day5", day: "dayinfo5", astro: {sunset: "now", sunrise: "later"}, hour: [{time: "time9", details: "details9"},{time: "time10", details: "details10"}]}]
                        }
              }
      @weather_forecast = Weather.new(info)
    end
    it "has attributes" do
      expect(@weather_forecast).to be_an_instance_of(Weather)
      expect(@weather_forecast.current_weather).to be_a(Hash)
      expect(@weather_forecast.daily_five_days).to be_a(Array)
      expect(@weather_forecast.hourly_current_day).to be_a(Array)
      expect(@weather_forecast.hourly_current_day.count).to eq(2)
      expect(@weather_forecast.hourly_tomorrow).to be_a(Array)
      expect(@weather_forecast.hourly_tomorrow.count).to eq(2)
    end
  end 
end 
      
