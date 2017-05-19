class Diagnosis < ActiveRecord::Base
  include ApplicationHelper
  attr_reader :table_headings, :table_body
  attr_accessor :time_ago_amount, :time_ago_scale, :duration_amount, :duration_scale, :frequency_amount, :frequency_scale, :descriptors

  before_save :concat_duration, :concat_time_ago, :concat_frequency, :descriptors_to_note

  has_one :gallery

  belongs_to :topic
  belongs_to :visit, inverse_of: :diagnoses, required: false
  belongs_to :patient, inverse_of: :diagnoses

  def self.table_headings
    %w[Date Description Present Note When Duration Frequency Actions]
  end

  def concat_duration
    self.duration = "for #{duration_amount} #{duration_scale}" unless duration_amount.nil? || duration_scale.nil?
  end

  def concat_time_ago
    self.time_ago = "#{time_ago_amount} #{time_ago_scale} ago" unless time_ago_amount.nil? || time_ago_scale.nil?
  end

  def concat_frequency
    self.frequency = "#{frequency_amount} #{frequency_scale} ago" unless frequency_amount.nil? || frequency_scale.nil?
  end

  def descriptors_to_note
    list = descriptors ? descriptors.join(', ') : nil
    if note.blank?
      self.note = list
    else
      self.note += "; #{list}"
    end
  end

  def table_body
    action_view = ActionView::Base.new(Rails.configuration.paths['app/views'])
    action_view.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper

      def protect_against_forgery?
        false
      end
    end

    {
      'date': created_at.strftime('%b %Y'),
      'description': find_trail(topic_id),
      'present': present,
      'note': blank_unless_present(note),
      'when': blank_unless_present(time_ago),
      'duration': blank_unless_present(duration),
      'frequency': blank_unless_present(frequency),
      # 'attachments': action_view.render(
      #   partial: 'layouts/attachment_thumbnails', format: :txt,
      #   locals: { model: self }
      # ).html_safe,
      'actions': action_view.render(
        partial: 'diagnoses/link_buttons', format: :txt,
        locals: { d: self }
      ).html_safe
    }
  end

  def times
    clause = ''
    clause << " #{time_ago} ago" unless time_ago.blank?
    clause << " for #{duration}" unless duration.blank?
    clause
  end

  def generate_summary
    ap = present? ? 'presence' : 'absence'
    "#{ap.with_indefinite_article} of #{find_pretty_trail(topic_id)}"
  end
  def generate_full_summary
    generate_summary << times
  end
end
