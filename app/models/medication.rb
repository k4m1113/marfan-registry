class Medication < ActiveRecord::Base
  include ActiveSupport::NumberHelper
  attr_reader :table_headings, :table_body

  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :medications

  validates :name,
    presence: true
  validates :ingestion_method,
    presence: true

  def self.table_headings
    return ["Date", "Name", "Instructions", "Status", "Actions"]
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
    if self.current === true
      status = 'current'
    elsif self.current === false
      status = 'discontinued'
    else
      status = 'not noted'
    end

    if self.common_name != nil
      name = "#{self.name} (#{self.common_name.upcase}) #{sprintf("%g", self.dose)} #{self.dose_unit_of_measurement} #{self.dosage_form}"
    elsif common_name == nil
      name = "#{self.name}"
    end
    return {
      'date': self.created_at.strftime("%b %Y"),
      'name': name,
      'instructions': self.ingestion_method,
      'status': status,
      'actions': "#{action_view.render(
        partial: 'medications/link_buttons', format: :txt,
        locals: { m: self})}".html_safe
    }
  end

  def generate_summary
    summ = "#{self.name.downcase}"
    unless self.topic_id == 66 || self.topic.depth < 1
      summ << ", #{self.topic.parent.name.with_indefinite_article.singularize},"
    end
    if self.common_name.nil?
      summ << " #{self.ingestion_method.downcase.gsub(/^take /, '').gsub(/^place /, '').rstrip.gsub(/\.$/, '')}"
    else
      summ << " at #{number_to_human(self.dose)} #{self.dose_unit_of_measurement} #{self.ingestion_method.downcase.gsub(/^take /, '').gsub(/^place /, '').rstrip.gsub(/\.$/, '')}"
    end
    return summ
  end
end
