class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :breakfast, null: false
      t.string :lunch, null: false
      t.string :dinner, null: false
      t.string :snack, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
