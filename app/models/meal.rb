class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_calorie_images
  has_many :images, through: :meal_calorie_images
  has_many :calories, through: :meal_calorie_images
  validates :breakfast, :lunch, :dinner, :snack, presence: true
end
