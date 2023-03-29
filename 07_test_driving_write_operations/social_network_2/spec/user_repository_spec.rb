require "user_repository"

RSpec.describe UsersRepository do
    def reset_users_table
        seed_sql = File.read('spec/users_seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_2_test' })
        connection.exec(seed_sql)
      end

      before(:each) do 
        reset_users_table
      end
      
    it "returns a list of all users" do
        repo = UsersRepository.new

        users = repo.all
        expect(users.length).to eq(2)
        expect(users.first.email_address).to eq('sally@fake.com')
        expect(users.first.user_name).to eq('sally_fake')
    end

    it "returns a single user based on ID" do
        repo = UsersRepository.new

        user = repo.find(1)
        expect(user.email_address).to eq('sally@fake.com')
        expect(user.user_name).to eq('sally_fake')
    end

    it "creates a new user" do
        repo = UsersRepository.new

        new_user = User.new
        new_user.email_address = 'sidra@fake.com'
        new_user.user_name = 'sidra_fake'

        repo.create(new_user)

        users = repo.all

        last_user = users.last
        expect(last_user.email_address).to eq('sidra@fake.com')
        expect(last_user.user_name).to eq('sidra_fake')
    end

    it "deletes a user" do
        repo = UsersRepository.new

        id_to_delete =1
        repo.delete(id_to_delete)
        
        all_users = repo.all
        expect(all_users.length).to eq(2)
    end
end