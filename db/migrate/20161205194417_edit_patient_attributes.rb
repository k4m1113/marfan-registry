class EditPatientAttributes < ActiveRecord::Migration
  def change
    change_column_null :patients, :first_name, true
    change_column_null :patients, :last_name, true
    change_column_null :patients, :address_line_1, true
    change_column_null :patients, :city, true
    change_column_null :patients, :state, true
    change_column_null :patients, :country, true
    change_column_null :patients, :postal_code, true
    change_column_null :patients, :date_of_birth, true

    change_table :patients do |t|
      t.boolean :deceased
      t.string :cause_of_death

      t.string :note
    end
  end
end
