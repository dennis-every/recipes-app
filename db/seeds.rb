# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#10.times do
#  User.create!(name: Faker::Name.name)
#end

#10.times do
#  Food.create!(name: Faker::Food.dish)
#end

10.times do
  dish_name = Faker::Food.dish
  dish_description = Faker::Food.description

  Recipe.create!(name: dish_name, description: dish_description)
end

User.create!(name: 'John Doe', email: 'test@test.com', password: 'password')
  