class Record < ApplicationRecord
  belongs_to :user, optional: true # ユーザーに対する関連付け。optional: true で user_id の存在を任意とする
  has_many_attached :images
  has_one_attached :breakfast_img
  has_one_attached :lunch_img
  has_one_attached :dinner_img
  has_one_attached :snack_img
  # 他のバリデーションやロジックが必要であれば追加
end