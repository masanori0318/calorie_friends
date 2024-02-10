class Record < ApplicationRecord
  belongs_to :user, optional: true # ユーザーに対する関連付け。optional: true で user_id の存在を任意とする
  
  # 他のバリデーションやロジックが必要であれば追加
end