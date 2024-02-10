class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :breakfast_img
      t.string :lunch_img
      t.string :dinner_img
      t.string :snack_img
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :snack
      t.integer :breakfast_cal
      t.integer :lunch_cal
      t.integer :dinner_cal
      t.integer :snack_cal

      # その他必要なカラムがあれば追加してください
      t.timestamps
    end
  end
end
