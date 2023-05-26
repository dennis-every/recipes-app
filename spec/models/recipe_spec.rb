require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'Riley', email: 'rileymark@gmail.com', password: 'something')
    @recipe = Recipe.new(user: @user, name: 'Pasta', preparation_time: 15, cooking_time: 10,
                         description: 'Lorem ipsum', public: true)
  end

  context 'Testing Validations' do
    it 'recipe is valid' do
      expect(@recipe).to be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many recipes' do
      assoc = Recipe.reflect_on_association(:ingredients)
      expect(assoc.macro).to eq :has_many
    end
    it 'belongs_to user' do
      assoc = Recipe.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
