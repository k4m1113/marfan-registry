class AddRelationshipsTable < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :seeded_relationship_type, null: false
      t.belongs_to :visit

      t.integer :patient_id, null: false
      t.integer :relationship_patient_id, null: false
    end
  end
end
