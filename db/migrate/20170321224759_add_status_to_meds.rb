class AddStatusToMeds < ActiveRecord::Migration[5.0]
  def change
    change_table :medications do |t|
      t.boolean :current
    end
  end
end
