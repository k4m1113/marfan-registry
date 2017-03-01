class AddMeasurementFieldsToTopics < ActiveRecord::Migration
  def change
    change_table :topics do |t|
      t.float :min_value
      t.float :max_value
      t.float :step
      t.string :units_of_measurement, array: true
    end
  end
end
