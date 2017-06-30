class AddGeneticTestType < ActiveRecord::Migration[5.1]
  def up
    create_table :genetic_tests do |t|
      t.belongs_to :topic, null: false
      t.belongs_to :patient, null: false
      t.belongs_to :visit
      t.string :transcript
      t.string :protein
      t.string :variant
      t.integer :exons
      t.string :lab_classification
      t.string :clinical_classification
      t.boolean :predictive_testing_recommended
      t.string :lab_name
      t.date :date
      t.string :attachment
      t.text :note

      t.timestamps null: false
    end
  end

  def down
    drop_table :genetic_tests
  end
end
