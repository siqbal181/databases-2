require "post_repository"

RSpec.describe PostsRepository do
    def reset_posts_table
        seed_sql = File.read('spec/posts_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_media_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_posts_table
    end
    
    it "shows a list of posts" do
        repo = PostsRepository.new
        posts = repo.all
        expect(posts.length).to eq(2)
        expect(posts.first.title).to eq('My best post')
        expect(posts.first.content).to eq('Such a great read.')
    end

    it "finds a single post based on ID" do
        repo = PostsRepository.new

        post = repo.find(1)
        expect(post.title).to eq 'My best post'
        expect(post.content).to eq 'Such a great read.'
        expect(post.user_id).to eq('1')
    end

    it "creates a new post" do
        repo = PostsRepository.new

        post = Post.new
        post.title = 'New post'
        post.content = 'New content'
        post.number_of_views = '500'
        post.user_id = '1'
        repo.create(post) # => nil

        posts = repo.all

        last_post = posts.last
        expect(last_post.title).to eq('New post')
        expect(last_post.content).to eq('New content')
    end

    it "deletes a post based on id" do
        repo = PostsRepository.new

        id_to_delete =1
        repo.delete(id_to_delete)

        all_posts = repo.all
        expect(all_posts.length).to eq(1)
    end
end
