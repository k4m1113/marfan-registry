class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :sex, null: false
      t.date :date_of_birth, null: false
    end
  end
end
