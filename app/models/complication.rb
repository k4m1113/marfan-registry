class Complication < ActiveRecord::Base
  include ApplicationHelper
  attr_reader :table_headings, :table_body

  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :complications

  validates :note,
    presence: true

  def self.table_headings
    return ['Date', 'Description', 'Note', 'Attachments', 'Actions']
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
      'date': self.created_at.strftime("%b %Y"),
      'description': find_trail(self.topic_id),
      'note': print_if_present(self.note),
      'attachments': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self})}".html_safe,
      'actions': "#{action_view.render(
        partial: 'complications/link_buttons', format: :txt,
        locals: { c: self})}".html_safe
    }
  end

  def generate_summary
    return "#{self.note.with_indefinite_article} of #{find_pretty_trail(self.topic_id)}"
  end
end
