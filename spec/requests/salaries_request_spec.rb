require 'rails_helper'

RSpec.describe "Salaries", type: :request do
  describe "GET /api/v1/salaries?destination=chicago" do
    context "happy path" do 
      it "the user will make a get request to the city and you will return the local salary tech information along with the current weather forecast for that city", :vcr do
      
        get "/api/v1/salaries?destination=chicago"

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq("null")
        expect(parsed_response[:data][:attributes]).to be_a(Hash)
        expect(parsed_response[:data][:attributes][:destination]).to be_a(String)
        expect(parsed_response[:data][:attributes][:destination]).to eq("chicago")
        expect(parsed_response[:data][:attributes][:forecast]).to be_a(Hash)
        expect(parsed_response[:data][:attributes][:forecast][:summary]).to be_a(String)
        expect(parsed_response[:data][:attributes][:forecast][:temperature]).to be_a(String)
        expect(parsed_response[:data][:attributes][:forecast][:temperature].chop.to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:salaries]).to be_a(Array)
        parsed_response[:data][:attributes][:salaries].each do |employment|
          expect(employment).to be_a(Hash)
          expect(employment[:title]).to be_a(String)
          expect(employment[:min]).to be_a(String)
          expect(employment[:max]).to be_a(String)
          expect(employment[:min][1...-3].to_i).to be_a(Integer)
          expect(employment[:max][1...-3].to_i).to be_a(Integer)
        end
      end 

      it "the user will make a get request to the city and you will return the local salary tech information along with the current weather forecast for that city- test 2", :vcr do
      
        get "/api/v1/salaries?destination=denver"

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:id]).to eq("null")
        expect(parsed_response[:data][:attributes]).to be_a(Hash)
        expect(parsed_response[:data][:attributes][:destination]).to be_a(String)
        expect(parsed_response[:data][:attributes][:destination]).to eq("denver")
        expect(parsed_response[:data][:attributes][:forecast]).to be_a(Hash)
        expect(parsed_response[:data][:attributes][:forecast][:summary]).to be_a(String)
        expect(parsed_response[:data][:attributes][:forecast][:temperature]).to be_a(String)
        expect(parsed_response[:data][:attributes][:forecast][:temperature].chop.to_i).to be_a(Integer)
        expect(parsed_response[:data][:attributes][:salaries]).to be_a(Array)
        parsed_response[:data][:attributes][:salaries].each do |employment|
          expect(employment).to be_a(Hash)
          expect(employment[:title]).to be_a(String)
          expect(employment[:min]).to be_a(String)
          expect(employment[:max]).to be_a(String)
          expect(employment[:min][1...-3].to_i).to be_a(Integer)
          expect(employment[:max][1...-3].to_i).to be_a(Integer)
        end
      end 
    end 
  end 
end 