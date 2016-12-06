class AddSeededRelationshipTypesTable < ActiveRecord::Migration
  def change
    create_table :seeded_relationship_types, { id: false } do |t|
      t.integer :ahnentafel_id, null: false
      t.integer :generation, null: false
      t.string :name, null: false
      t.string :name_camelcase, null: false
      t.string :name_underscore, null: false
      t.string :description, null: false
      t.string :gender, null: false

      t.timestamps null: false
    end
  end
end
