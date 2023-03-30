require "student_repository"

RSpec.describe StudentRepository do
    def reset_students_table
        seed_sql = File.read('spec/student_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_students_table
    end

    it "gets all the students" do
        repo = StudentRepository.new

        students = repo.all

        expect(students.length).to eq(2)
        expect(students[0].id).to eq('1')
        expect(students[0].name).to eq('David')
        expect(students[0].cohort_id).to eq('1')
    end

    it "gets a single student" do

        repo = StudentRepository.new

        student = repo.find(1)

        expect(student.id).to eq('1') # =>  1
        expect(student.name).to eq('David') # =>  'David'
        expect(student.cohort_id).to eq('1') # =>  'April 2022'
    end
end