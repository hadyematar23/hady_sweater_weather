require 'rails_helper'

RSpec.describe "Road Trip", type: :request do
  describe "POST /api/v0/road_trip" do
    context "happy path" do 
      it "you will make a post call with the proposed email, password, and password confirmation in the payload", :vcr do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "London,England",
            "destination": "Moscow,Russia",
            "api_key": user.api_key
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:type]).to eq("road trip")
        expect(parsed_response[:data][:attributes][:start_city]).to eq("London,England")
        expect(parsed_response[:data][:attributes][:end_city]).to eq("Moscow,Russia")
        expect(parsed_response[:data][:attributes][:travel_time]).to be_a(String)
        expect(parsed_response[:data][:attributes][:travel_time].slice(-2..-1).to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:datetime].slice(0..3).to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)
        
      end 

      it "new york to los angeles", :vcr do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "New York,NY",
            "destination": "Los Angeles,CA",
            "api_key": user.api_key
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:type]).to eq("road trip")
        expect(parsed_response[:data][:attributes][:start_city]).to eq("New York,NY")
        expect(parsed_response[:data][:attributes][:end_city]).to eq("Los Angeles,CA")
        expect(parsed_response[:data][:attributes][:travel_time]).to be_a(String)
        expect(parsed_response[:data][:attributes][:travel_time].slice(-2..-1).to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:datetime].slice(0..3).to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)

      end

      it "new york to panama city, panama", :vcr do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "New York,NY",
            "destination": "Panama City,Panama",
            "api_key": user.api_key
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:type]).to eq("road trip")
        expect(parsed_response[:data][:attributes][:start_city]).to eq("New York,NY")
        expect(parsed_response[:data][:attributes][:end_city]).to eq("Panama City,Panama")
        expect(parsed_response[:data][:attributes][:travel_time]).to be_a(String)
        expect(parsed_response[:data][:attributes][:travel_time].slice(-2..-1).to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:datetime].slice(0..3).to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
        expect(parsed_response[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)

      end
    end 

    context "an API key must be sent and it must be valid or else, even with valid directions, will not produce directions" do 
      it "invalid API Key is passed" do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "New York,NY",
            "destination": "Panama City,Panama", 
            "api_key": SecureRandom.hex(16)
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true) 
        expect(response).to have_http_status(401)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:type]).to eq("errors")
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:attributes][:error_messages]).to eq("You must pass a valid API key in the payload of your Post request")

      end

      it "no API Key is passed" do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "New York,NY",
            "destination": "Panama City,Panama"
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true) 
        expect(response).to have_http_status(401)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:type]).to eq("errors")
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:attributes][:error_messages]).to eq("You must pass a valid API key in the payload of your Post request")

      end
    end

    context "sad path and edge cases" do 
      it "an impossible road trip because you can't drive it", :vcr do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "New York,NY",
            "destination": "London,UK",
            "api_key": user.api_key
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:type]).to eq("road trip")
        expect(parsed_response[:data][:attributes][:start_city]).to eq("New York,NY")
        expect(parsed_response[:data][:attributes][:end_city]).to eq("London,UK")
        expect(parsed_response[:data][:attributes][:travel_time]).to eq("impossible")
        expect(parsed_response[:data][:attributes][:weather_at_eta]).to be_empty


      end

      xit "trip possible but destination is over 5 days away and so cannot provide weather", :vcr do 
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "origin": "London,England",
            "destination": "Kuala Lumpur,Malysia",
            "api_key": user.api_key
        }

        post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:type]).to eq("road trip")
        expect(parsed_response[:data][:attributes][:start_city]).to eq("London,England")
        expect(parsed_response[:data][:attributes][:end_city]).to eq("Kuala Lumpur,Malysia")
        expect(parsed_response[:data][:attributes][:travel_time]).to eq("impossible")
        expect(parsed_response[:data][:attributes][:weather_at_eta]).to be_empty
      end
    end
  end 
end 