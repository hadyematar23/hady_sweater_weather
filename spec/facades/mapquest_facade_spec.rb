require 'rails_helper'

RSpec.describe MapquestFacade, type: :facade do
  describe "location coordinates" do
    it "inputs a city and will output the coordinates in a hash", :vcr do #I determined that a PORO was not necessary here and thought it would be essentially overengineering
      @facade = MapquestFacade.new

      result = @facade.find_location_coordinates("Atlanta,GA")
      expect(result).to be_a(Hash)
      expect(result[:lat]).to be_a(Float)
      expect(result[:lng]).to be_a(Float)
    end
  end 

  describe "driving directions" do 
    it "inputs two cities, an origin and destination, and the result is a PORO with the information you want about the roadtrip", :vcr do 
      @facade = MapquestFacade.new

      result = @facade.driving_directions("Atlanta,GA", "Macon,GA")
      expect(result).to be_an_instance_of(RoadTrip)
      expect(result.origin).to be_a(String)
      expect(result.destination).to be_a(String)
      expect(result.time).to be_a(String)
      expect(result.time).to include(":")

    end
  end
end