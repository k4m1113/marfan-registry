class AddRelatedToTopics < ActiveRecord::Migration[5.1]
  def up
    change_table :topics do |t|
      t.integer :related, array: true
      t.string :part_of_speech
    end
  end
  
  def down
    change_table :topics do |t|
      t.remove :related
      t.remove :part_of_speech
    end
  end
end
