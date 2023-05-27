class ShoppingListController < ApplicationController
  skip_load_and_authorize_resource only: :index

  def index
    @shopping_list = current_user.shopping_list
    @shopping_list_value = current_user.shopping_list_value
  end
end
