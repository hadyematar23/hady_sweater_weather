class TeleportService 

  def get_search_results(location)
    get_url("cities?search=#{location}&embed=city:search-results")
  end

  private 

  def get_url(payload)
    response = connection.get(payload) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection 
    Faraday.new(url: "https://api.teleport.org/api/")
    end
  end
  
end