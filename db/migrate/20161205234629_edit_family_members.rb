class EditFamilyMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :family_members, :relationship, :string
    remove_column :family_members, :name, :string
    remove_column :family_members, :age, :integer
    remove_column :family_members, :living, :boolean
    remove_column :family_members, :cause_of_death, :string
    remove_column :family_members, :note, :string

    change_table :family_members do |t|
      t.belongs_to :seeded_relationship_type, null: false

      t.jsonb :future_patient_data_hash
    end
  end
end
