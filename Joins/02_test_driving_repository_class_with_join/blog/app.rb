require_relative 'lib/post_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect('blog_2')

post_repository = PostRepository.new

post = post_repository.find_with_comments(1)

puts "#{post.title}: #{post.contents}"
puts "Comments: "
post.comments.each do |comment|
  puts "#{comment.title}: #{comment.contents}"
end