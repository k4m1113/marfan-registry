class AddVitalsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :vitals do |t|
      t.belongs_to :patient, null: false
      t.belongs_to :topic, null: false
      t.integer :visit_id
      t.string :measurement
      t.string :note
      t.timestamps null: false
    end
  end
end
