class Diagnosis < ActiveRecord::Base
  include ApplicationHelper
  attr_reader :table_headings, :table_body
  attr_accessor :presence

  before_save :presence_to_note
  after_save { |d| d.destroy if d.note.blank? }

  has_one :gallery

  belongs_to :topic
  belongs_to :visit, inverse_of: :diagnoses, required: false
  belongs_to :patient, inverse_of: :diagnoses

  def presence_to_note
    self.note = if presence == "true"
                  'presence'
                elsif presence == "false"
                  'absence'
                end
  end

  def self.table_headings
    %w[Description Note Attachments Actions]
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
      'note': print_if_present(note),
      'attachments': action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self }
      ).html_safe,
      'actions': action_view.render(
        partial: 'complications/link_buttons', format: :txt,
        locals: { d: self }
      ).html_safe
    }
  end

  def generate_summary
    "#{note.with_indefinite_article} of #{find_pretty_trail(topic_id)}"
  end
end
