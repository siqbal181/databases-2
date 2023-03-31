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
        expect(posts).to eq('* 1 How to use Git\n * 2 Ruby classes\n * 3 Using IRB \n * 7 SQL basics')
    end
end

