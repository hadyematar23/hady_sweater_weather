require 'rails_helper'

RSpec.describe "Forecast", type: :request do
  describe "GET /api/v0/forecast?location=cincinatti,oh" do
    it "the get call will be for a certain city and it gives you the weather back for that location", :vcr do
      get "/api/v0/forecast?location=miami,fl", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }
      
      headers = response.request.headers.to_h.deep_symbolize_keys

      expect(headers[:CONTENT_TYPE]).to eq("application/json")
      expect(headers[:HTTP_ACCEPT]).to eq("application/json")

      parsed_forecast = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_forecast).to be_a(Hash)
      expect(parsed_forecast[:data][:id]).to eq(nil)
      expect(parsed_forecast[:data][:type]).to eq("forecast")
      expect(parsed_forecast[:data][:attributes]).to be_a(Hash)
      
      expect(parsed_forecast[:data][:attributes][:current_weather]).to be_a(Hash)
      expect(parsed_forecast[:data][:attributes][:current_weather][:last_updated]).to be_a(String)
      expect(parsed_forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(parsed_forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(parsed_forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(parsed_forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Float)
      expect(parsed_forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Float)
      expect(parsed_forecast[:data][:attributes][:current_weather][:condition]).to be_a(String)
      expect(parsed_forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)
      expect(parsed_forecast[:data][:attributes][:current_weather][:icon]).to include(".png")

      unwanted_keys = [
        :temp_c, :is_day, :wind_mph, :wind_kph, :wind_degree, :wind_dir, :pressure_mb, 
        :pressure_in, :precip_mm, :precip_in, :cloud, :feelslike_c, :feelslike_f, 
        :vis_km, :vis_miles, :gust_mph, :gust_kph
      ]
      
      unwanted_keys.each do |key|
        expect(parsed_forecast[:data][:attributes][:current_weather]).not_to have_key(key)
      end
      

      expect(parsed_forecast[:data][:attributes][:daily_weather]).to be_a(Array)
      expect(parsed_forecast[:data][:attributes][:daily_weather].count).to eq(5)

      unwanted_daily_weather_keys = [
        :date_epoch, :day, :astro, :maxtemp_c, :mintemp_c, :avgtemp_c, :avgtemp_f,
        :maxwind_mph, :maxwind_kph, :totalprecip_mm, :totalprecip_in, :totalsnow_cm,
        :avgvis_km, :avgvis_miles, :avghumidity, :daily_will_it_rain, :daily_chance_of_rain,
        :daily_will_it_snow, :daily_chance_of_snow, :uv, :moonrise,
        :moonset, :moon_phase, :moon_illumination, :is_moon_up, :is_sun_up
      ]

      parsed_forecast[:data][:attributes][:daily_weather].each do |daily|
        expect(daily).to be_a(Hash)
        expect(daily[:date]).to be_a(String)
        expect(daily[:sunrise]).to be_a(String)
        expect(daily[:sunset]).to be_a(String)
        expect(daily[:max_temp]).to be_a(Float)
        expect(daily[:min_temp]).to be_a(Float)
        expect(daily[:condition]).to be_a(String)
        expect(daily[:icon]).to be_a(String)
        expect(daily[:icon]).to include(".png")
        unwanted_daily_weather_keys.each do |daily_weather_key|
          expect(daily).not_to have_key(daily_weather_key)
        end
      end
      
      expect(parsed_forecast[:data][:attributes][:hourly_weather]).to be_a(Array)
      expect(parsed_forecast[:data][:attributes][:hourly_weather].count).to eq(24)

      unwanted_hourly_weather_keys = [
        :time_epoch, :temp_c, :temp_f, :is_day, :wind_mph, :wind_kph,
        :wind_degree, :wind_dir, :pressure_mb, :pressure_in, :precip_mm,
        :precip_in, :humidity, :cloud, :feelslike_c, :feelslike_f, :windchill_c,
        :windchill_f, :heatindex_c, :heatindex_f, :dewpoint_c, :dewpoint_f,
        :will_it_rain, :chance_of_rain, :will_it_snow, :chance_of_snow, :vis_km,
        :vis_miles, :gust_mph, :gust_kph, :uv
      ]

      parsed_forecast[:data][:attributes][:hourly_weather].each do |hourly|
        expect(hourly).to be_a(Hash)
        expect(hourly[:time]).to be_a(String)
        expect(hourly[:time]).to include("00")
        expect(hourly[:temperature]).to be_a(Float)
        expect(hourly[:conditions]).to be_a(String)
        expect(hourly[:icon]).to be_a(String)
        expect(hourly[:icon]).to include(".png")
        unwanted_hourly_weather_keys.each do |key|
          expect(hourly).not_to have_key(key)
        end
      end
    end
  end
end
