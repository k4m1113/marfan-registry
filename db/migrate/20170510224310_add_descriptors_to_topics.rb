class AddDescriptorsToTopics < ActiveRecord::Migration[5.0]
  def change
    change_table :topics do |t|
      t.string :descriptors, array: true
    end
  end
end
