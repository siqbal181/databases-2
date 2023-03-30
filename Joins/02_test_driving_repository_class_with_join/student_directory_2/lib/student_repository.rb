require_relative './student'

class StudentRepository

    # Selecting all records
    # No arguments
    def all
      sql = 'SELECT id, name, cohort_id FROM students;'
      sql_params = []
      result_set = DatabaseConnection.exec_params(sql, sql_params)

      students = []

      result_set.each do |record|
        student = Student.new
        student.id = record['id']
        student.name = record['name']
        student.cohort_id = record['cohort_id']

        students << student
      end
      return students
    end
  
    def find(id)
        sql = 'SELECT id, name, cohort_id FROM students WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]
        student = Student.new
        student.id = record['id']
        student.name = record['name']
        student.cohort_id = record['cohort_id']

        return student
    end
  end