require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'Riley', email: 'rileymark@gmail.com', password: 'something')
    @recipe = Recipe.create(user: @user, name: 'Pasta', preparation_time: 15, cooking_time: 10,
                            description: 'Lorem ipsum', public: false)
    @food = Food.create(user: @user, name: 'Apples', measurement_unit: 'pieces', price: 18, quantity: 24)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 2)
  end

  context 'Testing Validations' do
    it 'recipe_food to be valid' do
      expect(@recipe_food).to be_valid
    end

    it 'validates recipe_id' do
      @recipe_food.recipe_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'validates food_id' do
      @recipe_food.food_id = nil
      expect(@recipe_food).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to recipe' do
      assoc = RecipeFood.reflect_on_association(:recipe)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      assoc = RecipeFood.reflect_on_association(:food)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
