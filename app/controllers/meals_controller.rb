class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meals_path, notice: 'Meal was successfully created.'
    else
      @meals = Meal.all
      flash.now[:alert] = 'Failed to create meal.'
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:breakfast, :lunch, :dinner, :snack)
  end
end