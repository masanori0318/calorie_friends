class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :breakfast_img
  has_one_attached :lunch_img
  has_one_attached :dinner_img
  has_one_attached :snack_img
end
