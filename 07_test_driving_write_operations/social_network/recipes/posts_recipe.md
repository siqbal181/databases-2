## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{posts}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, number_of_views, post_id) VALUES ('My best post', 'Such a great read.', '100', '1');
INSERT INTO posts (title, content, number_of_views, post_id) VALUES ('Average post', 'Average words here.', '2000', '2');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: posts

# Model class
# (in lib/post.rb)
class Post
end

# Repository class
# (in lib/post_repository.rb)
class PostsRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: posts

# Model class
# (in lib/post.rb)

class Post

  # Replace the attributes by your own columns.
  attr_accessor :title, :content, :number_of_views, :user_id
end

```
## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, content, number_of_views, user_id FROM posts;
    # Returns an array of post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title, content, number_of_views, user_id WHERE id = $1;

    # Returns a single post object.
  end

  def create(post)
  # Executes the SQL query:
  # INSERT INTO posts (title, content, number_of_views, user_id) VALUES($1, $2, $3, $4);
  # Doesn't return anything
  end

  def delete(id)
  # Executes the SQL query:
  # DELETE FROM posts WHERE id = $1;
  # DOESN'T RETURN ANYTHING
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

```ruby
# EXAMPLES

# # 1
# # Get all posts

# repo = PostsRepository.new

# posts = repo.all
# posts.length # => 2
# posts.first.title # => 'My best post'
# posts.first.content # => 'Such a great read.'

# 2 
# Find a single post based on ID
repo = PostsRepository.new

post = repo.find(1)
expect(post.title).to eq 'My best post'
expect(post.content).to eq 'Such a great read.'

# 3
# Create a new post
repo = PostRepository.new

post = Post.new
post.title = 'New post'
post.content = 'New content'
post.number_of_views = '500'
post.user_id = '1'
repo.create(post) # => nil

posts = repo.all

last_post = posts.last
expect(last_post.title).to eq('New post')
expect(last_post.content).to eq('New content')

# 4 
# Deletes a post based on ID
repo = PostsRepository.new

id_to_delete =1
repo.delete(id_to_delete)

all_posts = repo.all
expect(all_posts.length).to eq(1)

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