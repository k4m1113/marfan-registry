class AddParametersToPatients < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.string :phone_1, null: false
      t.string :phone_2
      t.string :email, null: false
      t.string :middle_name
      t.string :primary_diagnosis
    end
  end
end
