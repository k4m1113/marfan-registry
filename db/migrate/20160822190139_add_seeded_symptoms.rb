class AddSeededSymptoms < ActiveRecord::Migration
  def change
    create_table :seeded_symptoms do |t|
      t.string :name, presence: true
      t.string :common_name, presence: true
      t.integer :ghent_value, presence: true
      t.integer :beighton_value, presence: true
      t.string :systemic_category, presence: true
    end
  end
end
