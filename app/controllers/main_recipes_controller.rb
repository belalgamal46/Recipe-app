class MainRecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy update edit]
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @food = Food.all
    @recipe_food = RecipeFood.includes(:food)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to main_recipe_path(@recipe), notice: 'Recipe was created successfully'
    else render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to main_recipe_path(@recipe), notice: 'Your recipe is set to public successfully'
    else
      redirect_to main_recipe_path(@recipe), notice: 'Something went wrong your recipe is not updated'
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to main_recipes_path, notice: 'Recipe was successfully deleted'
    else redirect_to main_recipe_path(@recipe), notice: 'Something wrong happened recipe is not deleted'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
