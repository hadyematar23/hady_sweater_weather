require 'rails_helper'

RSpec.describe TeleportService, type: :service do
  describe "get salary results based on a location provided by the user", :vcr do
    before :each do
      @service = TeleportService.new
    end
    it "you provide a city and it will provide you with all of the salary information for that urban area" do
      results = @service.get_salary_results("warsaw")
      expect(results).to be_a(Hash)
      expect(results[:salaries]).to be_a(Array)
      results[:salaries].each do |job|
        expect(job).to be_a(Hash)
        expect(job[:job]).to be_a(Hash)
        expect(job[:job][:id]).to be_a(String)
        expect(job[:job][:title]).to be_a(String)
        expect(job[:salary_percentiles]).to be_a(Hash)
        expect(job[:salary_percentiles][:percentile_25]).to be_a(Float)
        expect(job[:salary_percentiles][:percentile_50]).to be_a(Float)
        expect(job[:salary_percentiles][:percentile_75]).to be_a(Float)
      end
    end
  end
end 
  