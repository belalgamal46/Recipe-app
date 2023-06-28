# frozen_string_literal: true

class MainRecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def destroy
    if @recipe.destroy
      redirect_to main_recipes_path, notice: "Recipe was successfully deleted"
    else redirect_to main_recipe_path(@recipe), notice: "Something wrong happened recipe is not deleted"
    end
  end

  def show
    @foods = Food.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      if @recipe.public
        puts @recipe.public
        redirect_to main_recipe_path(@recipe), notice: "Your recipe is set to public"
      else
        puts @recipe.public
        redirect_to main_recipe_path(@recipe), notice: "Your recipe is set to private"
      end
    else
      redirect_to main_recipe_path(@recipe), notice: "Something went wrong"
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:public)
  end
end
