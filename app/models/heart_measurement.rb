class HeartMeasurement < ApplicationRecord
  include ApplicationHelper

  mount_uploader :attachment, AttachmentUploader

  attr_accessor :test_amount, :test_unit_of_meas, :absolute_start_date, :descriptors

  belongs_to :topic
  belongs_to :visit, inverse_of: :heart_measurements, required: false
  belongs_to :patient, inverse_of: :heart_measurements

  before_save :concat_result, :descriptors_to_note, :timeify

  def timeify
    if absolute_start_date != nil
      self.test_date = absolute_start_date
    elsif time_ago && time_ago_scale
      self.test_date = find_date(time_ago, time_ago_scale, created_at)
    else
      self.test_date = created_at
    end
  end

  def descriptors_to_note
  end

  def concat_result
    self.measurement = "#{test_amount} #{test_unit_of_meas}"
  end

  def abbreviated
    "#{topic.name}: #{measurement}"
  end

  def generate_summary; end

  def generate_full_summary; end

  def self.table_headings
    %w[Date Name Measurement Note Attachments Actions]
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
      'measurement': print_if_present(self.measurement),
      'note': print_if_present(self.note),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self})}".html_safe,
      'actions': "#{action_view.render(
        partial: 'heart_measurements/link_buttons', format: :txt,
        locals: { h: self})}".html_safe
    }
  end
end
