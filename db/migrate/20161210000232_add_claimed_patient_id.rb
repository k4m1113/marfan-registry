class AddClaimedPatientId < ActiveRecord::Migration
  def change
    change_table :family_members do |t|
      t.integer :claimed_patient_id
    end
  end
end
