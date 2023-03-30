require_relative 'lib/database_connection'
require_relative 'lib/student_repository'
require_relative 'lib/cohort_repository'

DatabaseConnection.connect('student_directory_2')

student_repository = StudentRepository.new
cohort_repository = CohortRepository.new

student_repository.all.each do |student|
    p student
end

cohort_repository.all.each do |cohort|
    p cohort
end