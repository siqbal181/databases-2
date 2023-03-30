require_relative "./cohort"

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
  end