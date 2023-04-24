class MapquestService 

  def get_coordinates(location)
    get_url("address?location=#{location}")
  end

  private 

  def get_url(payload)
    response = connection.get(payload) 
    results = JSON.parse(response.body, symbolize_names: true)
    return results[:results].first[:locations].first[:latLng]
  end

  def connection 
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/") do |f|
      f.params["key"] = ENV['Mapquest_API_KEY']
    end
  end
  
end