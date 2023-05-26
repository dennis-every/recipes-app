class ShoppingListController < ApplicationController
  def index
    @shopping_list = current_user.shopping_list
    @shopping_list_value = current_user.shopping_list_value
  end
end
