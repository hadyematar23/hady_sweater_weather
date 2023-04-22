require 'rails_helper'

RSpec.describe MapquestService, type: :service do
  describe "get coordinates", :vcr do
    before :each do
      @service = MapquestService.new
    end
    it "you provide a city and it will provide you with the coordinates in a hash along with a lot of other information that we do not end up using" do
      results = @service.get_coordinates("Houston,TX")
      expect(results).to be_a(Hash)
      expect(results[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
      expect(results[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)

    end
  end
end 
  
