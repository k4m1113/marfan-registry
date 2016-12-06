class AddRelationshipsTable < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :seeded_relationship_type, null: false

      t.integer :patient_id, null: false
      t.integer :relation_patient_id, null: false
    end
  end
end
