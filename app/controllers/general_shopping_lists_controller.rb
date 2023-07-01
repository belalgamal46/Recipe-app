class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.includes(:food)
    @food_count = RecipeFood.select(:food_id).distinct.count
  end
end
