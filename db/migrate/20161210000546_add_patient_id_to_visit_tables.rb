class AddPatientIdToVisitTables < ActiveRecord::Migration[5.0]
  def change
    remove_reference :family_members, :visit
    remove_reference :hospitalizations, :visit
    remove_reference :tests, :visit
    remove_reference :symptoms, :visit

    change_table :family_members do |t|
      t.belongs_to :patient, null: false
      t.integer :visit_id
    end
    change_table :hospitalizations do |t|
      t.belongs_to :patient, null: false
      t.integer :visit_id
    end
    change_table :tests do |t|
      t.belongs_to :patient, null: false
      t.integer :visit_id
    end
    change_table :symptoms do |t|
      t.belongs_to :patient, null: false
      t.integer :visit_id
    end
  end
end
