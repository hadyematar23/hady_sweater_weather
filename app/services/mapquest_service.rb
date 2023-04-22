class MapquestService 

  def get_coordinates(location)
    get_url("address?location=#{location}")
  end
  private 

  def get_url(payload)
    response = connection.get(payload) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection 
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/") do |f|
      f.params["key"] = ENV['Mapquest_API_KEY']
    end
  end
  
end