class AddHeartImagingFunction < ActiveRecord::Migration[5.0]
  def change
    create_table :heart_imagings do |t|
      t.belongs_to :patient, null: false

      t.string :imaging_tech, null: false
      t.integer :aortic_root_measurement_id
      t.integer :ascending_aortic_measurement_id
      t.integer :transverse_arch_measurement_id
      t.integer :descending_thoracic_measurement_id
      t.integer :suprarenal_abdominal_measurement_id
      t.integer :infrarenal_abdominal_measurement_id
      t.integer :aortic_annulus_measurement_id

      t.timestamps null: false
    end
  end
end
