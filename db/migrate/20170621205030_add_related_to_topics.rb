class AddRelatedToTopics < ActiveRecord::Migration[5.1]
  def up
    change_table :topics do |t|
      t.integer :related, array: true
    end
  end
  def down
    change_table :topics do |t|
      t.remove :related
    end
  end
end
