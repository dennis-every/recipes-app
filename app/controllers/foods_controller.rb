class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def destroy
    @food = Food.find(params[:id])

    @food.destroy
    redirect_to foods_path
  end
end
