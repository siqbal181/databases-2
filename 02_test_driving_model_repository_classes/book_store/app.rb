require_relative 'lib/database_connection'
require_relative 'lib/books_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

books_repository = BooksRepository.new

books_repository.all.each do |book|
    p "#{book.title} - #{book.author_name}"
end