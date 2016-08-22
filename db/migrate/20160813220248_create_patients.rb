class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :sex, null: false
      t.integer :month_of_birth, null: false
      t.integer :day_of_birth, null: false
      t.integer :year_of_birth, null: false

      t.timestamps null: false
    end
  end
end
