class HeartMeasurementDataType < ActiveRecord::Migration[5.1]
  def up
    create_table :heart_measurements do |t|
      t.belongs_to :topic, null: false
      t.belongs_to :patient, null: false
      t.belongs_to :visit
      t.string :measurement
      t.string :note
      t.datetime :test_date
      t.integer :time_ago
      t.string :time_ago_scale
      t.string :attachment

      t.timestamps null: false
    end
  end

  def down
    drop_table :heart_measurements
  end
end
