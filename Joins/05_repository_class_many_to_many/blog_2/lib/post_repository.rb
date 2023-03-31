require_relative './post'
require_relative './tag'

class PostRepository
  def find_by_tag(tag_name)
    sql = 'SELECT posts.id, posts.title, tags.id as tag_id, tags.name as tag_name FROM tags
    JOIN posts_tags ON posts_tags.tag_id = tags.id
    JOIN posts ON posts_tags.post_id = posts.id
    WHERE tags.name = $1'    
    sql_params = [tag_name]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    posts = []

    result_set.group_by { |record| record['id'] }.
                  each do |post_id, post_records|
      post = Post.new(id: post_id, title: post_records[0]['title'], tags: [])

      post_records.each do |record|
        tag = Tag.new(id: record['tag_id'], name: record['tag_name'])
        post.tags << tag

      end
      posts << post
    end
    return posts
  end
end
