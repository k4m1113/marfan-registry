class AddSeededSymptoms < ActiveRecord::Migration[5.0]
  def change
    create_table :seeded_symptoms do |t|
      t.string :name, presence: true
      t.string :common_name, presence: true
      t.string :article, presence: true, allow_nil: true, allow_blank: true
      t.string :plural, presence: true
      t.integer :ghent_value, presence: true
      t.integer :beighton_value, presence: true
      t.string :systemic_category, presence: true
    end
  end
end
