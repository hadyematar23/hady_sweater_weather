class TeleportFacade

  def find_salary_info(city)
    @service = TeleportService.new
    salaries = @service.get_search_results(city)
  end


  
end