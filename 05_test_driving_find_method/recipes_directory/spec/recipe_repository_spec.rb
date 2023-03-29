require "recipe_repository"

RSpec.describe RecipesRepository do

    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
        connection.exec(seed_sql)
      end

      before(:each) do 
        reset_recipes_table
      end    

    it "returns a list of all recipes" do
        repo = RecipesRepository.new
        recipes = repo.all
        expect(recipes.length).to eq(2)
        expect(recipes.first.name).to eq ('Sticky Toffee Pudding')
        expect(recipes.first.rating).to eq('5')
    end

    it "returns the first Sticky Toffee Pudding recipe" do
        repo = RecipesRepository.new
        recipe = repo.find(1)
        expect(recipe.name).to eq('Sticky Toffee Pudding')
        expect(recipe.rating).to eq('5')
    end

    it "returns the second stir fry ecipe" do
        repo = RecipesRepository.new
        recipe = repo.find(2)
        expect(recipe.name).to eq('Stir Fry')
        expect(recipe.rating).to eq('2')
    end
end