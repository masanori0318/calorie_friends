class MealsController < ApplicationController
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to day_record_path, notice: 'Meal was successfully created.'
    else
      render 'records/day_record'
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :calories, :image)
  end
end

