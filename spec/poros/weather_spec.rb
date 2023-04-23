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
                {date: "day1", hour: [{time: "time1", details: "details1"},{time: "time2", details: "details2"}]}, 
                {date: "day2", hour: [{time: "time3", details: "details3"},{time: "time4", details: "details4"}]}, 
                {date: "day3", hour: [{time: "time5", details: "details5"},{time: "time6", details: "details6"}]}, 
                {date: "day4", hour: [{time: "time7", details: "details7"},{time: "time8", details: "details8"}]},
                {date: "day5", hour: [{time: "time9", details: "details9"},{time: "time10", details: "details10"}]}]
                        }
              }
      weather_forecast = Weather.new(info)
    end
    it "has attributes" do
      require 'pry'; binding.pry
    end
  end 
end 
      
