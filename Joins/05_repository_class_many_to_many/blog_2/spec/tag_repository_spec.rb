require "tag_repository"

RSpec.describe TagRepository do
    def reset_post_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_test' })
        connection.exec(seed_sql)
      end

      before(:each) do 
        reset_post_table
      end

      it "finds tags by a post_id" do
        tag_repository = TagRepository.new
        tags = tag_repository.find_by_post('1')
        expect(tags.name).to eq('coding')
      end      
end