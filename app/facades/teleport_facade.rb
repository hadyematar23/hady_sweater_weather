class TeleportFacade

  def find_salary_results(city)
    @service = TeleportService.new
    salaries = @service.get_salary_results(city)
    parsed = parse_salary_info(salaries[:salaries])
    SalaryInfo.new(parsed)
  end

  def parse_salary_info(service_info)
    desired_titles = ["Data Analyst", "Data Scientist", "Mobile Developer", "QA Engineer", "Software Engineer", "Systems Administrator", "Web Developer"]

    list = service_info.select do |job|
      desired_titles.include?(job[:job][:title])
    end
  
    return list
  end


  
end