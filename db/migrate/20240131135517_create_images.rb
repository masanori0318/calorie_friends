class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :breakfast_img, null: false
      t.string :lunch_img, null: false
      t.string :dinner_img, null: false
      t.string :snack_img, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end