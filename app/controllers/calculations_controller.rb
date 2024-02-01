class CalculationsController < ApplicationController
  def index
  end

  def calculate_bmr
    weight = params[:weight].to_f
    height = params[:height].to_f
    age = params[:age].to_i
    gender = params[:gender]
    
    if gender == 'male'
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    elsif gender == 'female'
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    else
      bmr = 0
    end

    render json: { bmr: bmr }
  end
end

