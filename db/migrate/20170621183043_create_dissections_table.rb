class CreateDissectionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :dissections do |t|
      t.belongs_to :patient, null: false
      t.belongs_to :visit

      t.string :location, null: false
      t.string :perfusion
      t.string :direction
      t.string :lumen

      t.datetime :absolute_start_date
      t.string :time_ago_scale
      t.integer :time_ago_amount
      t.string :note
      t.string :attachment

      t.timestamps null: false
    end
  end
end
