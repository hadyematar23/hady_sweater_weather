require 'rails_helper'

RSpec.describe WeatherFacade, type: :facade do
  describe "location coordinates" do
    before :each do
      coordinate = {:info=>{:statuscode=>0, :copyright=>{:text=>"© 2022 MapQuest, Inc.", :imageUrl=>"http://api.mqcdn.com/res/mqlogo.gif", :imageAltText=>"© 2022 MapQuest, Inc."}, :messages=>[]},
      :options=>{:maxResults=>-1, :ignoreLatLngInput=>false},
      :results=>
       [{:providedLocation=>{:location=>"miami,fl"},
         :locations=>
          [{:street=>"",
            :adminArea6=>"",
            :adminArea6Type=>"Neighborhood",
            :adminArea5=>"Miami",
            :adminArea5Type=>"City",
            :adminArea4=>"Miami-Dade",
            :adminArea4Type=>"County",
            :adminArea3=>"FL",
            :adminArea3Type=>"State",
            :adminArea1=>"US",
            :adminArea1Type=>"Country",
            :postalCode=>"",
            :geocodeQualityCode=>"A5XAX",
            :geocodeQuality=>"CITY",
            :dragPoint=>false,
            :sideOfStreet=>"N",
            :linkId=>"0",
            :unknownInput=>"",
            :type=>"s",
            :latLng=>{:lat=>25.77481, :lng=>-80.19773},
            :displayLatLng=>{:lat=>25.77481, :lng=>-80.19773},
            :mapUrl=>""}]}]}
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