require_relative './post'

class PostRepository

    def find_by_tag(tag_name)
      # Arrays 'posts' should contain 4 Post objects
      # relating to the tag 'coding'
      # Job: finds all posts for the given tag
      # SELECT posts.id, posts.title
  #   FROM tags
  #     JOIN posts_tags ON posts_tags.tag_id = tags.id
  #     JOIN posts ON posts_tags.post_id = posts.id
  #     WHERE tags.name = 'coding';
  
    end
  
  end