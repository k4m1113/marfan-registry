class Diagnosis < ActiveRecord::Base
  include ApplicationHelper
  attr_reader :table_headings, :table_body
  attr_accessor :time_ago_amount, :time_ago_scale, :duration_amount, :duration_scale

  before_save :concat_duration, :concat_time_ago

  has_one :gallery

  belongs_to :topic
  belongs_to :visit, inverse_of: :diagnoses, required: false
  belongs_to :patient, inverse_of: :diagnoses

  def self.table_headings
    %w[Date Description Present Note Attachments Actions]
  end

  def concat_duration
    self.duration = "#{duration_amount} #{duration_scale}" unless duration_amount.nil? || duration_scale.nil?
  end

  def concat_time_ago
    self.time_ago = "#{time_ago_amount} #{time_ago_scale}" unless time_ago_amount.nil? || time_ago_scale.nil?
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
      'note': print_if_present(note),
      'attachments': action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self }
      ).html_safe,
      'actions': action_view.render(
        partial: 'diagnoses/link_buttons', format: :txt,
        locals: { d: self }
      ).html_safe
    }
  end

  def generate_summary
    abs_or_pr = present? ? 'presence' : 'absence'
    "#{abs_or_pr.with_indefinite_article} of #{find_pretty_trail(topic_id)}"
  end
end
