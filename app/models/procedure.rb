class Procedure < ActiveRecord::Base
  attr_reader :table_headings, :table_body

  has_one :gallery

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :procedures
  belongs_to :patient,
    inverse_of: :procedures

  def self.table_headings
    return ['Date', 'Name', 'Note', 'Attachments', 'Actions']
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
      'date': display_date(self),
      'description': find_trail(self.topic_id),
      'note': print_if_present(self.note),
      'attachments': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self})}".html_safe,
      'actions': "#{action_view.render(
        partial: 'procedures/link_buttons', format: :txt,
        locals: { p: self})}".html_safe
    }
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
end
