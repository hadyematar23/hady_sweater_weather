require 'rails_helper'

RSpec.describe SalaryInfo, type: :model do
  describe "the Salary PORO " do
    before(:each) do 
      info = [{:job=>{:id=>"DATA-ANALYST", :title=>"Data Analyst"}, :salary_percentiles=>{:percentile_25=>46898.18614517015, :percentile_50=>56442.498784333024, :percentile_75=>67929.18726447425}},
        {:job=>{:id=>"DATA-SCIENTIST", :title=>"Data Scientist"}, :salary_percentiles=>{:percentile_25=>71025.60310363481, :percentile_50=>85799.94207526707, :percentile_75=>103647.55438088557}},
        {:job=>{:id=>"MOBILE-DEVELOPER", :title=>"Mobile Developer"}, :salary_percentiles=>{:percentile_25=>50649.8712176599, :percentile_50=>63346.924835957834, :percentile_75=>79226.91192891626}},
        {:job=>{:id=>"QA-ENGINEER", :title=>"QA Engineer"}, :salary_percentiles=>{:percentile_25=>46022.824981352605, :percentile_50=>56733.428314123645, :percentile_75=>69936.64316734018}},
        {:job=>{:id=>"SOFTWARE-ENGINEER", :title=>"Software Engineer"}, :salary_percentiles=>{:percentile_25=>67646.2253013339, :percentile_50=>82451.1152192146, :percentile_75=>100496.16768133474}},
        {:job=>{:id=>"SYSTEMS-ADMINISTRATOR", :title=>"Systems Administrator"}, :salary_percentiles=>{:percentile_25=>54967.079284456646, :percentile_50=>66153.69042177942, :percentile_75=>79616.94187484588}},
        {:job=>{:id=>"WEB-DEVELOPER", :title=>"Web Developer"}, :salary_percentiles=>{:percentile_25=>53704.53793049536, :percentile_50=>66545.38666217329, :percentile_75=>82456.50473241684}}]
      @salary_info = SalaryInfo.new(info)
    end

    it "exists as an instance" do 
      expect(@salary_info).to be_an_instance_of(SalaryInfo)
    end

    it "one readable attribute that is a hash" do
      expect(@salary_info.employment_hash).to be_a(Hash)
    end

    it "each key value pair of the employment hash attribute is made up of a key that is a string of the job name and a value with employment info in its own hash structure" do 
      @salary_info.employment_hash.each do |k,v|
        expect(k).to be_a(String)
        expect(v).to be_a(Hash)
        v.each do |percentile, percentile_value|
          expect(percentile).to be_a(Symbol)
          expect(percentile.to_s.include?("percentile")).to be true
          expect(percentile_value).to be_a(Float)
        end
      end
    end
  end 
end 
      
