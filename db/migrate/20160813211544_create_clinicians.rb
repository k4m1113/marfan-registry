class CreateClinicians < ActiveRecord::Migration
  def change
    create_table :clinicians do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end
