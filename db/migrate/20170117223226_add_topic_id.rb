class AddTopicId < ActiveRecord::Migration
  def change
    change_table :hospitalizations do |t|
      t.belongs_to :topic_id, null: false
    end
    change_table :symptoms do |t|
      t.remove :seeded_symptom_id
      t.belongs_to :topic_id, null: false
    end
    change_table :family_members do |t|
      t.belongs_to :topic_id, null: false
    end
    drop_table :dissections
    drop_table :seeded_relationship_types
  end
end
