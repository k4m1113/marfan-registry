class AddFrequencyToDiagnoses < ActiveRecord::Migration
  def change
    change_table :diagnoses do |t|
      t.string :frequency
    end
  end
end
