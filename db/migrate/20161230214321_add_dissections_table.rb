class AddDissectionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :dissections do |t|
      t.belongs_to :patient, null: false

      t.string :concern_type, null: false
      t.string :location, null: false
      t.string :extent
      t.datetime :when, null: false
      t.string :intervention, null: false
      t.string :complication
      t.integer :visit_id
      t.string :note

      t.timestamps null: false
    end
  end
end
