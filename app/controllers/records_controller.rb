class RecordsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def home
  end

  def day_record
    @user = current_user
    @image = Image.new
    @meal = Meal.new
    @calories = Calorie.new
  end

  def not_found
    render status: 404
  end
end
