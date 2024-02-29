class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :user, null: false

      t.string :breakfast, null: false
      t.string :lunch, null: false
      t.string :dinner, null: false
      t.string :snack, null: false
      t.integer :breakfast_cal, null: false
      t.integer :lunch_cal, null: false
      t.integer :dinner_cal, null: false
      t.integer :snack_cal, null: false

      # その他必要なカラムがあれば追加してください
      t.timestamps
    end
  end
end
