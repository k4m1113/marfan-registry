class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.belongs_to :visit, null: false

      t.string :relationship
      t.string :name
      t.integer :age
      t.boolean :living
      t.string :cause_of_death
      t.string :note
    end
  end
end
