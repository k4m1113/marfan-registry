class Hospitalization < ActiveRecord::Base
  include ApplicationHelper
  attr_reader :table_headings, :table_body

  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :hospitalizations

  validates :visit_id,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true
  validates :length_of_stay,
    numericality: { greater_than: 0 },
    allow_nil: true

  def self.table_headings
    return ['Date', 'Length of Stay', 'Name', 'Location', 'Description', 'Attachments', 'Actions']
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
      'date': (self.admission_date ? self.admission_date.strftime("%b %Y") : "not noted"),
      'length_of_stay': print_if_present(self.length_of_stay),
      'name': print_if_present(self.hosp_type),
      'location': print_if_present(self.location),
      'description': print_if_present(self.description),
      'attachments': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self})}".html_safe,
      'actions': "#{action_view.render(
        partial: 'hospitalizations/link_buttons', format: :txt,
        locals: { h: self})}".html_safe
    }
  end

  def generate_summary
    if self.note
      return "#{self.topic.name} (#{self.note})"
    else
      "#{self.topic.name} procedure"
    end
  end
end
