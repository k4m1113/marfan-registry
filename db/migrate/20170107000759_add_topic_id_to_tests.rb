class AddTopicIdToTests < ActiveRecord::Migration[5.0]
  def change
    change_table :tests do |t|
      t.belongs_to :topic, null: false
    end
    remove_column :tests, :test_type
    change_column_null :tests, :result, true
  end
end
