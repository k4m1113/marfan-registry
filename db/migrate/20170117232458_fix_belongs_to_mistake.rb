class FixBelongsToMistake < ActiveRecord::Migration
  def change
    change_table :hospitalizations do |t|
      t.remove :topic_id_id
      t.belongs_to :topic, null: false
    end
    change_table :symptoms do |t|
      t.remove :topic_id_id
      t.belongs_to :topic, null: false
    end
    change_table :family_members do |t|
      t.remove :topic_id_id
      t.remove :seeded_relationship_type_id
      t.integer :time_ago
      t.string :time_ago_scale
      t.datetime :death_date
      t.belongs_to :topic, null: false
    end
    change_table :procedures do |t|
      t.integer :time_ago
      t.string :time_ago_scale
      t.datetime :absolute_start_date
    end
  end
end
