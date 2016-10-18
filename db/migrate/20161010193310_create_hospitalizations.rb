class CreateHospitalizations < ActiveRecord::Migration
  def change
    create_table :hospitalizations do |t|
      t.belongs_to :visit, null: false

      t.datetime :admission_date
      t.integer :length_of_stay
      t.string :type
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
