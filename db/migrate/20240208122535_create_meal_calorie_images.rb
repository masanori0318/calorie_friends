class CreateMealCalorieImages < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_calorie_images do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :calorie, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
