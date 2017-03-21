class AddStatusToMeds < ActiveRecord::Migration
  def change
    change_table :medications do |t|
      t.boolean :current
    end
  end
end
