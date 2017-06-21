class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    change_table :tests do |t|
      t.timestamps null: false
    end
  end
end
