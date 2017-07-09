class ChangeTestDateAttribute < ActiveRecord::Migration[5.1]
  def change
    rename_column :tests, :absolute_start_date, :absolute_start_date
  end
end
