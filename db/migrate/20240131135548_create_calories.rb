class CreateCalories < ActiveRecord::Migration[7.0]
  def change
    create_table :calories do |t|
      t.integer :breakfast_cal, null: false
      t.integer :lunch_cal, null: false
      t.integer :dinner_cal, null: false
      t.integer :snack_cal, null: false
      t.integer :total_calorie, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
