class Medication < ApplicationRecord
  include ActiveSupport::NumberHelper
  mount_uploader :attachment, AttachmentUploader

  attr_reader :table_headings,
              :table_body

  attr_accessor :present

  before_create :current_or_not

  belongs_to :topic
  belongs_to :patient,
             inverse_of: :medications

  validates :name,
            presence: true
  validates :ingestion_method,
            presence: true

  def self.attributes
    %i[visit_id patient_id topic_id present dose dose_unit_of_measurement nested_med_id nested_med_category duration_amount duration_scale ingestion_method frequency frequency_scale common_name medication_format time_ago time_ago_scale absolute_start_date note name dosage_form dosage_form_units current attachment]
  end

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

    if current === true
      status = 'current'
    elsif current === false
      status = 'discontinued'
    else
      status = 'not noted'
    end

    if !common_name.nil? && !dose.nil?
      name = "#{self.name} (#{common_name.upcase}) #{sprintf('%g', dose)} #{dose_unit_of_measurement} #{dosage_form}"
    else
      name = self.name.to_s
    end
    {
      'date': created_at.strftime('%B %Y'),
      'name': name,
      'instructions': ingestion_method,
      'status': status,
      'actions': action_view.render(
        partial: 'medications/link_buttons',
        format: :txt,
        locals: { m: self }
      ).to_s.html_safe
    }
  end

  def current_or_not
    if !present.blank?
      self.current = present
    end
  end

  def generate_summary
    summ = "#{name.downcase}"
    summ << "( #{topic.parent.name.with_indefinite_article.singularize})" unless topic_id == 66 || topic.depth < 1
    summ
  end

  def generate_full_summary
    summ = "#{name.downcase}"
    unless topic_id == 66 || topic.depth < 1
      summ << ", #{topic.parent.name.with_indefinite_article.singularize},"
    end
    if common_name.nil?
      summ << " #{ingestion_method.downcase.gsub(/^take /, '').gsub(/^place /, '').rstrip.gsub(/\.$/, '')}"
    else
      summ << " at #{number_to_human(dose)} #{dose_unit_of_measurement} #{ingestion_method.downcase.gsub(/^take /, '').gsub(/^place /, '').rstrip.gsub(/\.$/, '')}"
    end
    summ
  end
end
