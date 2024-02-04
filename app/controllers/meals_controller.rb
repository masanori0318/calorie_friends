class MealsController < ApplicationController
  class MealsController < ApplicationController
    def index
      @meals = Meal.all
      @meal = Meal.new
    end
  
    def create
      Meal.create(meal_params)
      redirect_to meals_path
      
      #@meal = Meal.new(meal_params)

     #if @meal.save
      #redirect_to day_record_path, notice: 'Meal was successfully created.'
     #else
      #render 'records/day_record'
    end
  
  
    private
  
    def meal_params
      params.require(:meal).permit(:breakfast, :lunch, :dinner, :snack)
    end
  end
end