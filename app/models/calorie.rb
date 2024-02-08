class Calorie < ApplicationRecord
  belongs_to :user
  has_many :meal_calorie_images
  has_many :meals, through: :meal_calorie_images
  has_many :images, through: :meal_calorie_images
  before_save :calculate_total_calorie

  attr_accessor :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal

  private

  def calculate_total_calorie
    self.total_calorie = breakfast_cal + lunch_cal + dinner_cal + snack_cal
  end
end
