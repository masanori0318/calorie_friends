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
    # 必要に応じて他の属性も追加
    params.require(:meal).permit(:breakfast, :lunch, :dinner, :snack)
  end
end

