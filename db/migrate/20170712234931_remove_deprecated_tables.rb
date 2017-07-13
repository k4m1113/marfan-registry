class RemoveDeprecatedTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :complications
    drop_table :symptoms
    drop_table :galleries
    drop_table :seeded_symptoms
  end
end
