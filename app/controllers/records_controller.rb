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
    @meals = Meal.all
    @calories = Calorie.all
    @images = Image.all
  end

  def not_found
    render status: 404
  end
end
