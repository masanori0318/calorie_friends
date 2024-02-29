class Record < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :images

  # 各食事ごとに個別の画像をアタッチメントとして定義する
  has_one_attached :breakfast_img
  has_one_attached :lunch_img
  has_one_attached :dinner_img
  has_one_attached :snack_img

  # CarrierWave を使用して画像をアップロードするカラムを定義する
  mount_uploader :breakfast_image, ImageUploader
  mount_uploader :lunch_image, ImageUploader
  mount_uploader :dinner_image, ImageUploader
  mount_uploader :snack_image, ImageUploader
end