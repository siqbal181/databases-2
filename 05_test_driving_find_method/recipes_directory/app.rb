# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipesRepository.new

recipe_repository.all.each do |recipe|
    p "#{recipe.name} - Rated: #{recipe.rating}/5"
end