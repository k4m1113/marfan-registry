class CreateTopics < ActiveRecord::Migration[5.0]
  def self.up
    create_table :topics do |t|
      t.string :name
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.string :topic_type, null: false

      # optional fields
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0
    end
  end

  def self.down
    drop_table :topics
  end
end
