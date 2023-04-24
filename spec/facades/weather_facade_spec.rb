require 'rails_helper'

RSpec.describe WeatherFacade, type: :facade do
  describe "location coordinates" do
    before :each do
      coordinate = {:lat=>25.77481, :lng=>-80.19773}
      @facade = WeatherFacade.new(coordinate)
      @service = MapquestService.new
    end
    it "you input coordinate info and you will get back a hash of info that includes more than you need before you serialize it", :vcr do
      results = @facade.find_weather_five_days
          
      expect(results).to be_an_instance_of(Weather)
      expect(results.current_weather).to be_a(Hash)
      expect(results.daily_five_days).to be_a(Array)
      expect(results.daily_five_days.count).to eq(5)
      expect(results.hourly_current_day).to be_a(Array)
      expect(results.hourly_current_day.count).to eq(24)
      expect(results.hourly_tomorrow).to be_a(Array)
      expect(results.hourly_tomorrow.count).to eq(24)
    end
  end 
end