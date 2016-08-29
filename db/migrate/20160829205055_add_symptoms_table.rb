class AddSymptomsTable < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.belongs_to :seeded_symptom

      t.boolean :presence
      t.float :measurement
      t.datetime :start_date
      t.string :frequency
      t.text :note
    end
  end
end
