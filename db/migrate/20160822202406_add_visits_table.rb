class AddVisitsTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :patient,    null: false
      t.belongs_to :clinician,  null: false

      t.string :general_health
      t.float :height
      t.float :weight
      t.float :z_score
      t.string :primary_reason
      t.string :secondary_reason
      t.float :upper_segment
      t.float :lower_segment
      t.float :arm_span

      t.timestamps              null: false
    end
  end
end
