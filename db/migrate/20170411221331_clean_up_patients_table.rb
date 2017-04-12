class CleanUpPatientsTable < ActiveRecord::Migration
  def change
    change_column_default :patients, :deceased, false
    change_column_null :patients, :first_name, false
    change_column_null :patients, :last_name, false
    change_column_null :patients, :address_line_1, false
    change_column_null :patients, :city, false
    change_column_null :patients, :state, false
    change_column_null :patients, :country, false
    change_column_null :patients, :postal_code, false
    change_column_null :patients, :deceased, false
    change_column_null :patients, :date_of_birth, false
    change_column_null :patients, :email, false
    change_column_null :patients, :phone_1, false
    change_column :patients, :postal_code, :string
  end
end
