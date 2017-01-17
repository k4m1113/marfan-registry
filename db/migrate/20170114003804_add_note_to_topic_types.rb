class AddNoteToTopicTypes < ActiveRecord::Migration
  def change
    add_column :complications, :note, :string
    add_column :diagnoses, :note, :string
    add_column :family_members, :note, :string
    add_column :hospitalizations, :note, :string
    add_column :medications, :note, :string
    add_column :procedures, :note, :string
    add_column :tests, :note, :string
  end
end
