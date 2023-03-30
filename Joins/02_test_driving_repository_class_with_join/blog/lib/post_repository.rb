require_relative './post'
require_relative './comment'

class PostRepository

    def find_with_comments(id)
      # Executes the SQL query:
        # sql = 'SELECT posts.title, posts.contents, comments.title, comments.contents, comments.user_name 
        #     FROM posts JOIN comments ON posts.id = comments.posts_id WHERE posts.id = $1;'
          sql = 'SELECT posts.title AS "post_title", posts.contents AS "post_contents", comments.title AS "comment_title", 
              comments.contents AS "comment_contents", comments.user_name AS "comment_username"
              FROM posts JOIN comments ON posts.id = comments.posts_id WHERE posts.id = $1;'
        params = [id]
        result_set = DatabaseConnection.exec_params(sql, params)

        post = Post.new
        post.title = result_set.first['post_title']
        post.contents = result_set.first['post_contents']

        result_set.each do |row|
            comment = Comment.new
            comment.title = row['comment_title']
            comment.contents = row['comment_contents']
            comment.user_name = row['comment_username']
            post.comments << comment
        end
        return post
    end
  
  end