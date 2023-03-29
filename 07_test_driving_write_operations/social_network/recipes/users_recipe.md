## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email_address, user_name) VALUES ('sally@fake.com', 'sally_fake');
INSERT INTO users (email_address, user_name) VALUES ('anna@fake.com', 'anna_fake');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/users.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UsersRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :email_address, :user_name
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UsersRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, email_address, user_name FROM users;
    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, email_address, user_name FROM users WHERE id = $1;

    # Returns a single User object.
  end

  def create(student)
  # Executes the SQL query:
  # INSERT INTO users
  # (email_address, user_name)
  # VALUES($1, $2);
  # Doesn't return anything
  end

  def delete(id)
  # Executes the SQL query:
  # DELETE FROM users
  # WHERE id = $1;
  # DOESN'T RETURN ANYTHING
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

```ruby
# EXAMPLES

# # 1
# # Get all users

# repo = UsersRepository.new

# users = repo.all
# users.length # => 2
# users.first.email_address # => 'sally@fake.com'
# users.first.user_name # => 'sally_fake'

# # 2 
# # Find a single user based on ID
# repo = UsersRepository.new

# user = repo.find(1)
# user.email_address # => 'sally@fake.com'
# user.first.user_name # => 'sally_fake'

# 3 
# Create a new user based on User creation

repo = UsersRepository.new

new_user = User.new
new_user.email_address = 'sidra@fake.com'
new_user.user_name = 'sidra_fake'

repo.create(new_user)

users = repo.all
last_user = user.last

last_user.email_address # => 'sidra@fake.com'
last_user.user_name # => 'sidra_fake'


# 4 
# Deletes a user based on ID
repo = UsersRepository.new

id_to_delete =1
repo.delete(id_to_delete)

all_users = repo.all
all_users.length # => 1


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
