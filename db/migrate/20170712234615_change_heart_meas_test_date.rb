class ChangeHeartMeasTestDate < ActiveRecord::Migration[5.1]
  def change
    rename_column :heart_measurements, :test_date, :absolute_start_date
  end
end
