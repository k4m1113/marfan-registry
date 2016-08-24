class AddVisitsTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :patient, null: false
      t.belongs_to :clinician, null: false

      t.float :height, null: false
      t.float :weight, null: false
      t.float :z_score, null: false
      t.string :primary_reason, null: false
      t.string :secondary_reason
      t.float :upper_segment
      t.float :lower_segment
      t.float :arm_span
      t.json :symptoms, array: true

      t.timestamps null: false
    end
  end
end
