class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.belongs_to :patient, null: false

      t.integer :visit_id
      t.integer :dose
      t.string :dose_unit_of_measurement
      t.integer :nested_med_id
      t.integer :nested_med_category
      t.integer :duration_amount
      t.string :duration_scale
      t.string :ingestion_method
      t.integer :frequency
      t.string :frequency_scale
      t.string :common_name
      t.string :medication_format

      t.timestamps null: false
    end
  end
end
