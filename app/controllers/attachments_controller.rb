class AttachmentsController < ApplicationController
  before_action :set_gallery

  def create
    add_more_attachments(attachments_params[:attachments])
    flash[:error] = "Failed uploading attachments" unless @gallery.save
    redirect_to :back
  end

  def destroy
    remove_attachment_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting attachment" unless @gallery.save
    redirect_to :back
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def add_more_attachments(new_attachments)
    attachments = @gallery.attachments # copy the old attachments
    attachments += new_attachments # concat old attachments with new ones
    @gallery.attachments = attachments # assign back
  end

  def remove_attachment_at_index(index)
    remain_attachments = @gallery.attachments # copy the array
    deleted_attachment = remain_attachments.delete_at(index) # delete the target attachment
    deleted_attachment.try(:remove!) # delete attachment from S3
    @gallery.attachments = remain_attachments # re-assign back
  end

  def attachments_params
    params.require(:gallery).permit({attachments: []}) # allow nested params as array
  end
end
