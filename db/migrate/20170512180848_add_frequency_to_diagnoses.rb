class AddFrequencyToDiagnoses < ActiveRecord::Migration[5.0]
  def change
    change_table :diagnoses do |t|
      t.string :frequency
    end
  end
end
