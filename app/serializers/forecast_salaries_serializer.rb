class ForecastSalariesSerializer

  def create_forecast_salary_json(destination, forecast, salary)
    salaries_array = salary.employment_hash.map do |title, data|
      {
        "title": title, 
        "min": format("$%.2f", data[:percentile_25]), 
        "max": format("$%.2f", data[:percentile_75])
      }
    end
    
    {
      "data": {
        "id": "null",
        "type": "salaries",
        "attributes": {
          "destination": destination,
          "forecast": {
            "summary": forecast[:condition][:text],
            "temperature": "#{forecast[:temp_f].to_i} F"
          },
          "salaries": salaries_array
        }
      }
    }
  end
end
