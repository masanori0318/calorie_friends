class Record < ApplicationRecord
  belongs_to :user # optional: true を削除することで、ユーザーが必須になる
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

  def self.search(search)
    if search.present?
      # 検索対象のカラムを指定する
      Record.where('breakfast LIKE(?) OR lunch LIKE(?) OR dinner LIKE(?) OR snack LIKE(?)', "%#{search}%", "%#{search}%",
                   "%#{search}%", "%#{search}%")
    else
      Record.all
    end
  end
end
