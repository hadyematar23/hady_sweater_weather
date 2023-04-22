require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /api/v0/sessions" do
    context "happy path" do 
      it "you will make a post call with the proposed email, password, and password confirmation in the payload" do
        user = User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "email" => "hady1@gmail.com",
            "password" => "test123"
        }

        post "/api/v0/sessions", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(200)
        
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:attributes]).to be_a(Hash)
        expect(parsed_response[:data][:type]).to eq("users")
        expect(parsed_response[:data][:id]).to eq(user.id)
        expect(parsed_response[:data][:attributes][:email]).to eq(user.email)
        expect(parsed_response[:data][:attributes][:api_key]).to eq(user.api_key)
      end 
    end 

    context "sad path" do 
      it "you will make a post call with an email that does not exist you will get a 401 but the error message will not tell you whether it was your email or password that was incorrect" do

        user = User.create!(email: "hady@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "email" => "hady1@gmail.com",
            "password" => "test123"
        }

        post "/api/v0/sessions", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(401)
        
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:attributes]).to be_a(Hash)
        expect(parsed_response[:data][:type]).to eq("errors")
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:attributes][:error_messages]).to eq("That username or that password, or the combination, could not be found in the system.")
      end 

      it "you will make a post call with an incorrect password you will get a 401 but the error message will not tell you whether it was your email or password that was incorrect" do

        user = User.create!(email: "hady@gmail.com", password: "test123", password_confirmation: "test123")
        
        payload = {
            "email" => "hady@gmail.com",
            "password" => "test1234"
        }

        post "/api/v0/sessions", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(401)
        
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data][:attributes]).to be_a(Hash)
        expect(parsed_response[:data][:type]).to eq("errors")
        expect(parsed_response[:data][:id]).to eq(nil)
        expect(parsed_response[:data][:attributes][:error_messages]).to eq("That username or that password, or the combination, could not be found in the system.")
      end 
    end
  end 
end 