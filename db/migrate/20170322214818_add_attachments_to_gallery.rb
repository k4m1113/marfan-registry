class AddAttachmentsToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :attachments, :string, array: true, default: []
  end
end
