class ChangeTestDateAttribute < ActiveRecord::Migration[5.1]
  def change
    rename_column :tests, :absolute_start_date, :test_date
  end
end
