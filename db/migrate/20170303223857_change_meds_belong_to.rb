class ChangeMedsBelongTo < ActiveRecord::Migration
  def self.up
    change_table :medications do |t|
      t.remove :topic_id
      t.integer :topic_id
    end
  end

  def self.down
    change_table :medications do |t|
      t.belongs_to :topic
    end
  end
end
