class AddAttachmentsToGallery < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :attachments, :string, array: true, default: []
  end
end
