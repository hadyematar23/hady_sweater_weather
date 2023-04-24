require 'rails_helper'

RSpec.describe "Salaries", type: :request do
  describe "GET /api/v1/salaries?destination=chicago" do
    context "happy path" do 
      it "the user will make a get request to the city and you will return the local salary tech information", :vcr do
      
        get "/api/v1/salaries?destination=chicago"

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        require 'pry'; binding.pry
        # expect(parsed_response[:data]).to be_a(Hash)
        # expect(parsed_response[:data][:id]).to eq(nil)
        # expect(parsed_response[:data][:type]).to eq("users")
        # expect(parsed_response[:data][:id]).to eq(user.id)
        # expect(parsed_response[:data][:attributes][:email]).to eq(user.email)
        # expect(parsed_response[:data][:attributes][:api_key]).to eq(user.api_key)
      end 
    end 
  end 
end 