class Ingredient < RecipeFood
  def value
    quantity * food.price if quantity.present?
  end
end
