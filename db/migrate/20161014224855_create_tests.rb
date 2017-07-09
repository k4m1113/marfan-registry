class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.belongs_to :visit,  null: false

      t.string :test_type,         null: false
      t.string :result,       null: false
      t.datetime :absolute_start_date
    end
  end
end
