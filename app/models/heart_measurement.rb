class HeartMeasurement < ApplicationRecord
  include ApplicationHelper

  mount_uploader :attachment, AttachmentUploader

  attr_accessor :test_amount, :test_unit_of_meas, :descriptors, :time_ago_scale, :time_ago_amount

  before_save :concat_result, :descriptors_to_note, :timeify

  belongs_to :topic
  belongs_to :visit, inverse_of: :heart_measurements, required: false
  belongs_to :patient, inverse_of: :heart_measurements

  def descriptors_to_note
  end

  def concat_result
    self.measurement = "#{test_amount} #{test_unit_of_meas}"
  end

  def abbreviated
    "#{topic.name}: #{measurement}"
  end

  def generate_summary
    "#{topic.name} was #{measurement.squish} in #{created_at.strftime('%b %Y')}"
  end

  def generate_full_summary
    details = [generate_summary]
    details << "(#{note.squish})" if note
    details.join(' ')
  end

  def self.attributes
    [:visit_id, :topic_id, :patient_id, :present, :time_ago_amount, :time_ago_scale, :absolute_start_date, :test_amount, :test_unit_of_meas, :note, :attachment, descriptors: []]
  end

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
      'date': display_absolute_start_date(self),
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
