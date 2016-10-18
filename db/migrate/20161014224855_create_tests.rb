class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.belongs_to :visit,  null: false

      t.string :type,         null: false
      t.string :result,       null: false
    end
  end
end
