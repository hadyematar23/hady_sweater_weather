class TeleportFacade

  def find_salary_results(city)
    @service = TeleportService.new
    salaries = @service.get_salary_results(city)
  end


  
end