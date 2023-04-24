require 'rails_helper'

RSpec.describe MapquestDrivingService, type: :service do
  describe "get directions", :vcr do
    before :each do
      @service = MapquestDrivingService.new
    end
    it "you provide two cities and it will provide you with a hash of information related to driving the route between the two", :vcr do
      results = @service.get_directions("Houston,TX", "Boston,MA")
      expect(results).to be_a(String)
      expect(results).to include(":")
      expect(results[-2..-1].to_i).to be_a(Integer)

    end
  end
end 
  
