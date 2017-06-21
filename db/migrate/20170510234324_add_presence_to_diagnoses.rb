class AddPresenceToDiagnoses < ActiveRecord::Migration[5.0]
  def change
    remove_column :diagnoses, :time_ago_scale, :string
    change_column :diagnoses, :time_ago, :string
    change_table :diagnoses do |t|
      t.boolean :present, null: false
      t.string :duration
    end
  end
end
