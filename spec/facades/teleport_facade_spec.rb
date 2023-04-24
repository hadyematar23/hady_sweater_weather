require 'rails_helper'

RSpec.describe TeleportFacade, type: :facade do
  describe "find salary results for city" do
    context "happy paths" do 
      it "inputs a city and will output the minimum and maximum salary range info in a PORO-only enumerated positions", :vcr do
        @facade = TeleportFacade.new

        result = @facade.find_salary_results("warsaw")
        expect(result).to be_an_instance_of(SalaryInfo)
        
        expect(result.employment_hash).to be_a(Hash)
        expect(result.employment_hash.first.second).to be_a(Hash)
      end
    end 
    context "edge cases" do 
      it "if the city does not have all of the positions ", :vcr do
        @facade = TeleportFacade.new

        result = @facade.find_salary_results("warsaw")
        expect(result).to be_an_instance_of(SalaryInfo)
        
        expect(result.employment_hash).to be_a(Hash)
        expect(result.employment_hash.first.second).to be_a(Hash)
      end
    end
  end 

end