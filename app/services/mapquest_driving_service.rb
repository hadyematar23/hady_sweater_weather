class MapquestDrivingService 

  def get_directions(origin, destination)
    get_url("route?from=#{origin}&to=#{destination}")
  end

  private 

  def get_url(payload)
    response = connection.get(payload) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection 
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2/") do |f|
      f.params["key"] = ENV['Mapquest_API_KEY']
      f.params["ambiguities"] = "ignore"
      f.params["outFormat"] = "json"
      f.params["routeType"] = "fastest"
      f.params["doReverseGeocode"] = "false"
      f.params["enhanceNarrative"] = "false"
      f.params["avoidTimedConditions"] = "false"
    end
  end
  
end