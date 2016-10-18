class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.string :address_line_1, null: false
      t.string :address_line_2
      t.string :address_line_3
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.integer :postal_code, null: false

      t.string :sex, null: false
      t.datetime :date_of_birth, null: false

      t.timestamps null: false
    end
  end
end
