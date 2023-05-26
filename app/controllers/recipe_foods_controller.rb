def new
  @recipe = Recipe.find(params[:id])
  unless recipe.user == current_user
    flash[:alert] =
      'You do not have access to add an ingredient on a recipe that belongs to other Users.'
    return redirect_to recipes_path
  end

  @recipe_food = RecipeFood.new
  @foods = current_user.foods
end

def create
  @recipe = Recipe.find(params[:id])
  recipe_food = RecipeFood.new(recipe_food_params)
  recipe_food.recipe = @recipe

  if recipe_food.save
    redirect_to recipe_path(@recipe)
  else
    render :new, status: :unprocessable_entity
  end
end

def destroy
  recipe_food = RecipeFood.find(params[:id])

  unless recipe_food.recipe.user == current_user
    flash[:alert] =
      'You do not have access to delete the ingredient belongs to other Users.'
    return redirect_to recipes_path
  end

  recipe_food.destroy
  redirect_to recipes_path
end

  private

def recipe_food_params
  params.require(:recipe_food).permit(:quantity, :food_id)
end