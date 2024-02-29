class AddImagesToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :breakfast_image, :string
    add_column :records, :lunch_image, :string
    add_column :records, :dinner_image, :string
    add_column :records, :snack_image, :string
  end
end
