class Test < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  attr_accessor :test_amount, :test_unit_of_meas
  attr_reader :table_headings, :table_body

  before_save :concat_result

  belongs_to :topic
  belongs_to :visit, inverse_of: :tests, required: false
  belongs_to :patient, inverse_of: :tests

  has_one :gallery

  accepts_nested_attributes_for :gallery

  after_save { |t| t.destroy if (t.test_date.nil? && t.time_ago.nil?) || (t.result.blank?) }

  def concat_result
    unless test_amount.blank? || test_unit_of_meas.blank?
      self.result = "#{test_amount} #{test_unit_of_meas}"
    end
  end

  def self.table_headings
    %w[Date Name Result Attachments Actions]
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
      'date': display_test_date(self),
      'name': find_trail(self.topic_id),
      'result': print_if_present(self.result),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self})}".html_safe,
      'actions': "#{action_view.render(
        partial: 'tests/link_buttons', format: :txt,
        locals: { t: self})}".html_safe
    }
  end

  def generate_summary
    if self.test_date
      test_date = self.test_date
    elsif self.time_ago && self.time_ago_scale
      test_date = find_date(self.time_ago, self.time_ago_scale, self.created_at)
    else
      test_date = self.created_at
    end
    if Topic.roots.include?(self.topic.parent)
      descriptor = "#{self.topic.name}"
    else
      descriptor = "#{self.topic.name} for #{self.topic.parent.name}"
    end
    return "#{descriptor} was #{self.result}"
  end
end
