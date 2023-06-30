class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
    @recipes = Recipe.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to main_recipes_url, notice: 'Recipe food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipes = Recipe.all
    @foods = Food.all
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      redirect_to main_recipe_path(@recipe_food.recipe), notice: 'Recipe food item was updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.destroy
      redirect_to main_recipe_url, notice: 'Recipe food was successfully deleted'
    else
      redirect_to main_recipe_url, notice: 'Recipe food is not deleted'
    end
  end

  private

  def set_recipe_foods
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
end
