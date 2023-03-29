# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_media')

user_repository = UsersRepository.new
post_repository = PostsRepository.new

user_repository.all.each do |user|
  p user.user_name
end

post_repository.all.each do |post|
  p post.title
end