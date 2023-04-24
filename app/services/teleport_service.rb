class TeleportService 

  def get_salary_results(location)
    get_url("urban_areas/slug:#{location}/salaries")
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