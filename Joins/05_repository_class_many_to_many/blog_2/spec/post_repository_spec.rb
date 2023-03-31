require "post_repository"

RSpec.describe PostRepository do
    def reset_post_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_test' })
        connection.exec(seed_sql)
      end

      before(:each) do 
        reset_post_table
      end

      it "returns posts with the tag coding" do
        post_repository = PostRepository.new
        posts = post_repository.find_by_tag('coding')
        expect(posts.size).to eq(1)
        expect(posts[0].title).to eq("How to not code.")
        expect(posts[0].tags.size).to eq(1)
        expect(posts[0].tags[0].name).to eq("coding")
      end        
end

