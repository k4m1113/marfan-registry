class AddGeneticTestType < ActiveRecord::Migration[5.1]
  def up
    create_table :genetic_tests do |t|
      t.belongs_to :topic, null: false
      t.belongs_to :patient, null: false
      t.belongs_to :visit
      t.string :company
      t.string :test_type
      t.string :pathogenicity
      t.date :date
      t.string :attachment
      t.string :note

      t.timestamps null: false
    end
  end

  def down
    drop_table :genetic_tests
  end
end
