require_relative './post.rb'
require_relative './tag.rb'

class TagRepository

    def find_by_post(post_id)
        sql = 'SELECT posts.title AS "posts_title", tags.name AS "tags_name", posts.id AS "posts_id", tags.id AS "tags_id"
        FROM posts
        JOIN posts_tags ON posts_tags.post_id = posts.id
        JOIN tags ON posts_tags.tag_id = tags.id
        WHERE posts.id = $1'
        sql_params = [post_id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)
        first_record = result_set[0]

        tag = Tag.new(id: first_record['tags_id'], name: first_record['tags_name'])

        result_set.each do |result|
            post = Post.new(id: post_id, title: result_set[0]['posts_title'],tags: tags = [])

            tag.posts << post
        end
        return tag
    end
end