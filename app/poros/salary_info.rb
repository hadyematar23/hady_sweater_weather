class SalaryInfo
  attr_reader :employment_hash
  def initialize(info)
    @employment_hash = return_hash(info)
  end

  def return_hash(info)
    hash = {}
    results = info.map do |employment|
      hash[employment[:job][:title]] = employment[:salary_percentiles]
    end
    return hash 
  end
end