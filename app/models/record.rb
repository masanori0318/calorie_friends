class Record < ApplicationRecord
  # Recordモデルに関連する属性を定義します
  attr_accessor :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal, :breakfast_img, :lunch_img, :dinner_img, :snack_img

  # 必要に応じて、他のモデルとの関連性を定義します
end