class AddTopicIdToReasons < ActiveRecord::Migration
  def change
    create_table :procedures do |p|
      p.belongs_to :topic, null: false
      p.belongs_to :patient, null: false
      p.belongs_to :clinician

      p.integer :visit_id
      p.timestamps null: false
    end
    create_table :complications do |c|
      c.belongs_to :topic, null: false
      c.belongs_to :patient, null: false

      c.integer :time_ago
      c.string :time_ago_scale
      c.datetime :absolute_start_date

      c.integer :visit_id
      c.timestamps null: false
    end
    create_table :diagnoses do |d|
      d.belongs_to :topic, null: false
      d.belongs_to :patient, null: false

      d.integer :time_ago
      d.string :time_ago_scale
      d.datetime :absolute_start_date

      d.integer :visit_id
      d.timestamps null: false
    end
    change_table :medications do |m|
      m.belongs_to :topic, null: false

      m.integer :time_ago
      m.string :time_ago_scale
      m.datetime :absolute_start_date
    end
  end
end
