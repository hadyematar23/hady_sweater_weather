require 'rails_helper'

RSpec.describe MapquestFacade, type: :facade do
  describe "location coordinates" do
    before :each do
      @service = MapquestService.new
    end
    it "inputs a city and will output the coordinates of the city in a coordinates poro", :vcr do
      @facade = MapquestFacade.new("Atlanta,GA")

      result = @facade.find_location_coordinates
      expect(result).to be_a(Hash)
      expect(result[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
      expect(result[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)
    end
  end 
end