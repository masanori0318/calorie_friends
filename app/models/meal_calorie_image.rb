class MealCalorieImage < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  belongs_to :calorie
  belongs_to :image
end
