require "post_repository"

RSpec.describe PostRepository do
    def reset_all_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_2_test' })
        connection.exec(seed_sql)
      end
      
        before(:each) do 
          reset_all_tables
        end

    it "finds one post with its comments" do
        repo = PostRepository.new

        post = repo.find_with_comments(1)
        comments = post.comments
        expect(comments.length).to eq(1) # =>  1
        expect(comments.first.user_name).to eq('dave') # =>  'dave'
        expect(comments.first.contents).to eq('How to use Google') # =>  'How to use Google'
    end
end