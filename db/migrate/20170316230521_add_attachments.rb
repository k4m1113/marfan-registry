class AddAttachments < ActiveRecord::Migration[5.0]
  def up
    add_column :complications, :attachments, :json
    add_column :diagnoses, :attachments, :json
    add_column :family_members, :attachments, :json
    add_column :heart_imagings, :attachments, :json
    add_column :hospitalizations, :attachments, :json
    add_column :medications, :attachments, :json
    add_column :patients, :attachments, :json
    add_column :procedures, :attachments, :json
    add_column :symptoms, :attachments, :json
    add_column :tests, :attachments, :json
    add_column :visits, :attachments, :json
  end

  def down
    remove_column :complications, :attachments, :json
    remove_column :diagnoses, :attachments, :json
    remove_column :family_members, :attachments, :json
    remove_column :heart_imagings, :attachments, :json
    remove_column :hospitalizations, :attachments, :json
    remove_column :medications, :attachments, :json
    remove_column :patients, :attachments, :json
    remove_column :procedures, :attachments, :json
    remove_column :symptoms, :attachments, :json
    remove_column :tests, :attachments, :json
    remove_column :visits, :attachments, :json
  end
end
