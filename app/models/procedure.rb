class Procedure < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  attr_reader :table_headings, :table_body
  attr_accessor :present, :time_ago_amount, :time_ago_scale, :descriptors

  before_create :concat_time_ago, :descriptors_to_note

  after_save { |p| p.destroy if (p.time_ago.nil? && p.note.blank? && p.attachment.nil?) }

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :procedures
  belongs_to :patient,
    inverse_of: :procedures

  after_save { |p| p.destroy if p.note.nil? }


  def self.table_headings
    %w[Date Name Note When Attachment Actions]
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
      'date': absolute_start_date.strftime('%b %Y'),
      'description': find_trail(topic_id),
      'note': print_if_present(note),
      'when': print_if_present(time_ago),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self })}".html_safe,
      'actions': "#{action_view.render(
        partial: 'procedures/link_buttons', format: :txt,
        locals: { p: self })}".html_safe
    }
  end

  def concat_time_ago
    if !time_ago_amount.blank? && !time_ago_scale.blank?
      date = find_date(time_ago_amount.to_i, time_ago_scale, Date.today)
      self.time_ago = "#{time_ago_amount} #{time_ago_scale} ago"
      self.absolute_start_date = date unless absolute_start_date
    end
  end

  def descriptors_to_note
    list = descriptors ? descriptors.join(', ') : nil
    if note.blank?
      self.note = list
    else
      self.note += "#{list}"
    end
  end

  def generate_summary
    details = "#{self.topic.name.with_indefinite_article} procedure for #{self.topic.parent.name}"
    if self.absolute_start_date
      adm = self.absolute_start_date
      details << " on #{self.absolute_start_date.strftime('%B %Y')}"
    elsif self.time_ago && self.time_ago_scale
      adm = find_date(self.time_ago, self.time_ago_scale, self.created_at)
      details << " in #{adm.strftime('%B %Y')}"
    else
      details << ""
    end
    if self.note
      details << " (#{self.note})"
    end
    return details
  end
  def generate_full_summary
    generate_summary
  end
end
