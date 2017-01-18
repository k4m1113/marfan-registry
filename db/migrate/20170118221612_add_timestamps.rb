class AddTimestamps < ActiveRecord::Migration
  def change
    change_table :tests do |t|
      t.timestamps null: false
    end
  end
end
