require 'rails_helper'

RSpec.describe "Creating a User", type: :request do
  describe "Post User Info with Payload" do
    context "happy path" do 
      it "you will make a post call with the proposed email, password, and password confirmation in the payload" do

        payload = {
            "email": "hady1@gmail.com",
            "password": "fakepassword",
            "password_confirmation": "fakepassword"
        }
        post "/api/v0/users", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        parsed_username = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(201)

        expect(parsed_username).to be_a(Hash)
        expect(parsed_username[:data]).to be_a(Hash)
        expect(parsed_username[:data][:type]).to eq("users")
        expect(parsed_username[:data][:id]).to be_a(Integer)
        expect(parsed_username[:data][:attributes]).to be_a(Hash)
        expect(parsed_username[:data][:attributes][:email]).to be_a(String)
        expect(parsed_username[:data][:attributes][:email]).to be_a(String)
        expect(parsed_username[:data][:attributes][:email]).to include("@")
        expect(parsed_username[:data][:attributes][:api_key]).to be_a(String)
      end 
    end 

    context "sad path" do 
      it "if the username already exists, you will get a status code of 409" do 

        User.create!(email: "hady1@gmail.com", password: "test123", password_confirmation: "test123")

        payload = {
          "email": "hady1@gmail.com",
          "password": "fakepassword",
          "password_confirmation": "fakepassword"
      }

        post "/api/v0/users", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        expect(response).to have_http_status(409)
        parsed_error = JSON.parse(response.body, symbolize_names: true)
      
        expect(parsed_error[:data]).to be_a(Hash)
        expect(parsed_error[:data][:type]).to eq("errors")
        expect(parsed_error[:data][:id]).to eq(nil)
        expect(parsed_error[:data][:attributes]).to be_a(Hash)
        expect(parsed_error[:data][:attributes][:error_messages]).to be_a(Array)
        expect(parsed_error[:data][:attributes][:error_messages].first).to eq("Email has already been taken")

      end

      it "if the passwords don't match, you will get a 400 status code" do 
        payload = {
          "email": "hady1@gmail.com",
          "password": "password",
          "password_confirmation": "fakepassword"
      }

        post "/api/v0/users", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        expect(response).to have_http_status(400)
       
        parsed_error = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_error[:data][:attributes][:error_messages].first).to eq("Password confirmation doesn't match Password")
      end

      it "if a field is missing, you will get a 400 status code" do 
        payload = {
          "email": "",
          "password": "fakepassword",
          "password_confirmation": "fakepassword"
      }

        post "/api/v0/users", headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, params: payload.to_json

        expect(response).to have_http_status(400)
        parsed_error = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_error[:data][:attributes][:error_messages].first).to eq("Email can't be blank")
      end
    end 
  end 
end 