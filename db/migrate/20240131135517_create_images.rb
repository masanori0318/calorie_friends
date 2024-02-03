class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_column :images, :breakfast_img, :string
    add_column :images, :lunch_img, :string
    add_column :images, :dinner_img, :string
    add_column :images, :snack_img, :string
  end
end