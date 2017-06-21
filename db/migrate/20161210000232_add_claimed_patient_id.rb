class AddClaimedPatientId < ActiveRecord::Migration[5.0]
  def change
    change_table :family_members do |t|
      t.integer :claimed_patient_id
    end
  end
end
