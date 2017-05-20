class ChangeAttachmentsFromArrays < ActiveRecord::Migration
  def up
    remove_column :complications, :attachments, :json
    remove_column :diagnoses, :attachments, :json
    remove_column :family_members, :attachments, :json
    remove_column :hospitalizations, :attachments, :json
    remove_column :medications, :attachments, :json
    remove_column :patients, :attachments, :json
    remove_column :procedures, :attachments, :json
    remove_column :symptoms, :attachments, :json
    remove_column :tests, :attachments, :json
    remove_column :visits, :attachments, :json

    add_column :complications, :attachment, :string
    add_column :diagnoses, :attachment, :string
    add_column :family_members, :attachment, :string
    add_column :hospitalizations, :attachment, :string
    add_column :medications, :attachment, :string
    add_column :patients, :attachment, :string
    add_column :procedures, :attachment, :string
    add_column :symptoms, :attachment, :string
    add_column :tests, :attachment, :string
  end
  def down
    add_column :complications, :attachments, :json
    add_column :diagnoses, :attachments, :json
    add_column :family_members, :attachments, :json
    add_column :hospitalizations, :attachments, :json
    add_column :medications, :attachments, :json
    add_column :patients, :attachments, :json
    add_column :procedures, :attachments, :json
    add_column :symptoms, :attachments, :json
    add_column :tests, :attachments, :json
    add_column :visits, :attachments, :json

    remove_column :complications, :attachment, :string
    remove_column :diagnoses, :attachment, :string
    remove_column :family_members, :attachment, :string
    remove_column :hospitalizations, :attachment, :string
    remove_column :medications, :attachment, :string
    remove_column :patients, :attachment, :string
    remove_column :procedures, :attachment, :string
    remove_column :symptoms, :attachment, :string
    remove_column :tests, :attachment, :string
  end
end
