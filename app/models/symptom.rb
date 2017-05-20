class Symptom < ApplicationRecord
  belongs_to :topic
  belongs_to :visit,
    inverse_of: :symptoms
  belongs_to :patient,
    inverse_of: :symptoms

  after_save { |s| s.destroy if s.presence.nil? }

  validates :presence,
    inclusion: { in: [true, false] },
    allow_nil: true
  validates :measurement,
    numericality: true,
    allow_nil: true

    def self.table_headings
      return %w[Date Name Present? Measurement Actions]
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
        'name': find_trail(topic_id),
        'present': presence,
        'measurement': print_if_present(measurement),
        'actions': action_view.render(
          partial: 'symptoms/link_buttons', format: :txt,
          locals: { s: self }
        ).html_safe
      }
    end

  def generate_summary; end
end
