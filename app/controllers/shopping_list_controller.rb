class ShoppingListController < ApplicationController
  def index
    @foods = []
    @foods_total = 0
    @foods.each do |food|
      @foods_total += food.quantity * food.price
    end
  end
end
