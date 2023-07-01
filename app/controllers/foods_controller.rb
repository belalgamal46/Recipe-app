class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @foods = Food.all
    @food = Food.new
  end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_path, notice: 'Food successfully created.'
    else
      render :new
    end
  end

  def update
    if @food.update(food_params)
      redirect_to foods_url, notice: 'Food was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food deleted successfully.'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
