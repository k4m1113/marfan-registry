class AddParamsToMeds < ActiveRecord::Migration[5.0]
  def change
    change_table :medications do |t|
      t.string :name
      t.string :dosage_form
      t.integer :dosage_form_units
    end
    change_column :medications, :dose, :decimal
  end
end
