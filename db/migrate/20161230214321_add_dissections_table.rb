class AddDissectionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :dissections do |t|
      t.belongs_to :patient, null: false
      t.belongs_to :visit
      t.belongs_to :topic, null: false

      t.string :concern_type, null: false
      t.string :location, null: false
      t.string :perfusion
      t.string :direction
      t.string :lumen
      t.string :attachment

      t.datetime :when, null: false
      t.string :note

      t.timestamps null: false
    end
  end
end
