require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe "get current weather for five days" do
    before :each do
      @service = WeatherService.new
    end
    it "you provide some coordinates and it will get you the weather for the next five days", :vcr do
      coordinate_info = ({:lat=>25.77481, :lng=>-80.19773})
      results = @service.get_current_weather_five_days(coordinate_info)
      expect(results).to be_a(Hash)
      expect(results[:location]).to be_a(Hash)
      expect(results[:current]).to be_a(Hash)
      expect(results[:current][:last_updated]).to be_a(String)
      expect(results[:current][:temp_f]).to be_a(Float)
      expect(results[:current][:condition]).to be_a(Hash)
      expect(results[:current][:condition][:text]).to be_a(String)
      expect(results[:current][:condition][:icon]).to be_a(String)
      expect(results[:current][:humidity]).to be_a(Integer)
      expect(results[:current][:uv]).to be_a(Float)
      expect(results[:forecast][:forecastday]).to be_a(Array)
      expect(results[:forecast][:forecastday].count).to eq(5)
      results[:forecast][:forecastday].each do |day|
        expect(day).to be_a(Hash)
        expect(day[:date]).to be_a(String)
        expect(day[:day]).to be_a(Hash)
        expect(day[:day][:condition]).to be_a(Hash)
        expect(day[:astro]).to be_a(Hash)
        expect(day[:astro][:sunrise]).to be_a(String)
        expect(day[:astro][:sunset]).to be_a(String)
        expect(day[:hour]).to be_a(Array)
        expect(day[:hour].count).to eq(24)
        day[:hour].each do |hour|
          expect(hour).to be_a(Hash)
          expect(hour[:time_epoch]).to be_a(Integer)
          expect(hour[:time]).to be_a(String)
          expect(hour[:temp_c]).to be_a(Float)
          expect(hour[:temp_f]).to be_a(Float)
          expect(hour[:is_day]).to be_a(Integer)
          expect(hour[:condition]).to be_a(Hash)
          expect(hour[:condition][:text]).to be_a(String)
          expect(hour[:condition][:icon]).to be_a(String)
          expect(hour[:condition][:code]).to be_a(Integer)
          expect(hour[:wind_mph]).to be_a(Float)
          expect(hour[:wind_kph]).to be_a(Float)
          expect(hour[:wind_degree]).to be_a(Integer)
          expect(hour[:wind_dir]).to be_a(String)
          expect(hour[:pressure_mb]).to be_a(Float)
          expect(hour[:pressure_in]).to be_a(Float)
          expect(hour[:precip_mm]).to be_a(Float)
          expect(hour[:precip_in]).to be_a(Float)
          expect(hour[:humidity]).to be_a(Integer)
          expect(hour[:cloud]).to be_a(Integer)
          expect(hour[:feelslike_c]).to be_a(Float)
          expect(hour[:feelslike_f]).to be_a(Float)
          expect(hour[:windchill_c]).to be_a(Float)
          expect(hour[:windchill_f]).to be_a(Float)
          expect(hour[:heatindex_c]).to be_a(Float)
          expect(hour[:heatindex_f]).to be_a(Float)
          expect(hour[:dewpoint_c]).to be_a(Float)
          expect(hour[:dewpoint_f]).to be_a(Float)
          expect(hour[:will_it_rain]).to be_a(Integer)
          expect(hour[:chance_of_rain]).to be_a(Integer)
          expect(hour[:will_it_snow]).to be_a(Integer)
          expect(hour[:chance_of_snow]).to be_a(Integer)
          expect(hour[:vis_km]).to be_a(Float)
          expect(hour[:vis_miles]).to be_a(Float)
          expect(hour[:gust_mph]).to be_a(Float)
          expect(hour[:gust_kph]).to be_a(Float)
          expect(hour[:uv]).to be_a(Float)
        end
      end
    end
  end
end 
  
