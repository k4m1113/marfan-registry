class AddDescriptorsToTopics < ActiveRecord::Migration
  def change
    change_table :topics do |t|
      t.string :descriptors, array: true
    end
  end
end
