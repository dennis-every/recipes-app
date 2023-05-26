class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  validates :name, presence: true

  def shopping_list
    foods = []
    recipes.each do |recipe|
      foods << recipe.foods
    end
    foods.flatten
  end

  def shopping_list_value
    shopping_list.sum { |food| food[:price] * food[:quantity] }
  end
end
