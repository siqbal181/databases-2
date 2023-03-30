require "cohort_repository"

RSpec.describe CohortRepository do

    def reset_cohort_table
        seed_sql = File.read('spec/cohort_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
        connection.exec(seed_sql)
    end
  
    before(:each) do 
      reset_cohort_table
    end

    it "returns all the cohorts" do
        repo = CohortRepository.new
        cohorts = repo.all
        expect(cohorts.length).to eq(3)
    end

    it "returns a single cohort based on ID" do
        repo = CohortRepository.new

        cohort = repo.find(1)

        expect(cohort.id).to eq("1")
        expect(cohort.name).to eq('March Cohort')
    end
end