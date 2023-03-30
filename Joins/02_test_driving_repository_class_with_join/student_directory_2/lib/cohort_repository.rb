require_relative "./cohort"
require_relative "./student"

class CohortRepository

    def all
        sql = 'SELECT id, name, starting_date FROM cohorts;'
        sql_params = []
        result_set = DatabaseConnection.exec_params(sql, sql_params)

        cohorts = []

        result_set.each do |record|
            cohort = Cohort.new
            cohort.id = record['id']
            cohort.name = record['name']
            cohort.starting_date = record['starting_date']

            cohorts << cohort
        end
        return cohorts
    end
  
    def find(id)
        sql = 'SELECT id, name, starting_date FROM cohorts WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]
        cohort = Cohort.new
        cohort.id = record['id']
        cohort.name = record['name']
        cohort.starting_date = record['starting_date']

        return cohort
    end

    def find_with_students(id)
        sql = 'SELECT cohorts.id AS "id", cohorts.name AS "cohort_name", cohorts.starting_date as "starting_date", students.name AS "student_name"
        FROM cohorts
        JOIN students
        ON cohorts.id = students.cohort_id
        WHERE cohorts.id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        first_result = result_set[0]
        cohort = Cohort.new
        cohort.id = first_result['id']
        cohort.name = first_result['cohort_name']
        cohort.starting_date = first_result['starting_date']

        result_set.each do |record|
            student = Student.new
            student.name = record['student_name']
            cohort.students << student
        end

        return cohort
    end
  end