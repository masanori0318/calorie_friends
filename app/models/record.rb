class Record < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :images

  # アタッチメントの名前を修正し、各食事の画像を個別のアタッチメントとして定義する
  has_one_attached :breakfast_img
  has_one_attached :lunch_img
  has_one_attached :dinner_img
  has_one_attached :snack_img
end