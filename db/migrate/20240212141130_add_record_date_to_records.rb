class AddRecordDateToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :date, :date
  end
end
