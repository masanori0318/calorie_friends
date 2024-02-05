class Meal < ApplicationRecord
  belongs_to :user
  
  validates :breakfast, :lunch, :dinner, :snack, presence: true
end
