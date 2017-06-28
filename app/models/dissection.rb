class Dissection < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  before_validation :timeify

  # attr_reader :table_headings, :table_body
  attr_accessor :time_ago_amount, :time_ago_scale

  belongs_to :topic
  belongs_to :visit, inverse_of: :dissections, required: false
  belongs_to :patient, inverse_of: :dissections

  def generate_summary

  end

  def self.table_headings
    %w[Date Location Direction Pefusion Lumen Note Attachment Actions]
  end

  def table_body
    action_view = ActionView::Base.new(Rails.configuration.paths["app/views"])
    action_view.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper

      def protect_against_forgery?
        false
      end
    end

    return {
      'date': print_if_present(absolute_start_date),
      'location': print_if_present(location),
      'direction': print_if_present(direction),
      'perfusion': print_if_present(perfusion),
      'lumen': print_if_present(lumen),
      'note': print_if_present(note),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self })}".html_safe,
      'actions': "#{action_view.render(
        partial: 'dissections/link_buttons', format: :txt,
        locals: { d: self})}".html_safe
    }
  end

  private

  def timeify
    if !time_ago_amount.nil? && !time_ago_scale.nil?
      self.absolute_start_date ||= find_date(time_ago_amount, time_ago_scale, Date.today)
      true
    else
      self.absolute_start_date = created_at
      true
    end
    true
  end
end
