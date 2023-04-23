# require 'rails_helper'

# RSpec.describe "Road Trip", type: :request do
#   describe "POST /api/v0/road_trip" do
#     context "happy path" do 
#       it "you will make a post call with the proposed email, password, and password confirmation in the payload", vcr: { cassette_name: 'road_trip_happy_path' } do 
#         user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
#         payload = {
#             "origin": "Cincinatti,OH",
#             "destination": "Chicago,IL",
#             "api_key": user.api_key
#         }

#         post "/api/v0/road_trip", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

#         parsed_response = JSON.parse(response.body, symbolize_names: true)
#       end 
#     end 
#   end 
# end 