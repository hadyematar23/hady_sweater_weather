require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  describe "the Weather PORO " do
    before(:each) do 
      info = {:location=>{:name=>"Chicago", :region=>"Illinois", :country=>"United States of America", :lat=>41.88, :lon=>-87.63, :tz_id=>"America/Chicago", :localtime_epoch=>1682357260, :localtime=>"2023-04-24 12:27"},
      :current=>
       {:last_updated_epoch=>1682356500,
        :last_updated=>"2023-04-24 12:15",
        :temp_c=>10.0,
        :temp_f=>50.0,
        :is_day=>1,
        :condition=>{:text=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png", :code=>1003},
        :wind_mph=>11.9,
        :wind_kph=>19.1,
        :wind_degree=>290,
        :wind_dir=>"WNW",
        :pressure_mb=>1023.0,
        :pressure_in=>30.2,
        :precip_mm=>0.0,
        :precip_in=>0.0,
        :humidity=>36,
        :cloud=>75,
        :feelslike_c=>9.6,
        :feelslike_f=>49.4,
        :vis_km=>16.0,
        :vis_miles=>9.0,
        :uv=>3.0,
        :gust_mph=>3.8,
        :gust_kph=>6.1}}
      @weather_forecast = CurrentWeather.new(info)
    end
    it "has attributes" do
      expect(@weather_forecast).to be_an_instance_of(CurrentWeather)
      expect(@weather_forecast.current_weather).to be_a(Hash)
      expect(@weather_forecast.current_weather[:temp]).to be_a(Float)
      expect(@weather_forecast.current_weather[:conditions]).to be_a(String)
    end
  end 
end 
      