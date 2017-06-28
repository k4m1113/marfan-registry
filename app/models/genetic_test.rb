# class for genetic test result
class GeneticTest < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  before_save :timeify

  # ATTRIBUTES
  attr_accessor :time_ago_amount, :time_ago_scale, :absolute_start_date, :present

  # RELATIONSHIPS
  belongs_to :topic
  belongs_to :visit, inverse_of: :genetic_tests, required: false
  belongs_to :patient, inverse_of: :genetic_tests, required: true

  # VALIDATIONS
  validates :topic, presence: true
  validates :patient, presence: true
  validates :visit_id,
            numericality: { only_integer: true },
            allow_nil: true
  validates :pathogenicity,
            inclusion: {
              in: %w[benign pathogenic VUS],
              message: 'should be benign, pathogenic, or variant of uncertain significance (VUS)'
            }

  validates :test_type,
            inclusion: {
              in: [
                'diagnostic',
                'newborn',
                'carrier',
                'prenatal',
                'preimplantation',
                'predictive',
                'forensic',
                'clinical diagnosis'
              ],
              message: 'genetic testing must include test type'
            }

  # INSTANCE METHODS
  def generate_summary
    "positive diagnosis for #{pathogenicity} variant of #{topic.name} gene"
  end

  def generate_full_summary;
    details = ["genetic diagnosis of"]
    details << "#{pathogenicity} variant of #{topic.name} gene"
    details << "by #{company}" if company
    details << "in #{date.strftime('%b %Y')}" if date
    details << "(#{note})" if note
    details.join(' ')
  end

  # TABLE VIEW ATTRIBUTES
  def self.table_headings
    %w[Date Location Pathogenicity Type Note Attachment Actions]
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
      'date': print_if_present(self.date),
      'location': print_if_present(company),
      'pathogenicity': print_if_present(pathogenicity),
      'type': print_if_present(test_type),
      'note': print_if_present(note),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self })}".html_safe,
      'actions': "#{action_view.render(
        partial: 'genetic_tests/link_buttons', format: :txt,
        locals: { t: self})}".html_safe
    }
  end

  private

  # BEFORE SAVE: hard-code fuzzy date data
  def timeify
    if !absolute_start_date.empty?
      self.date = absolute_start_date
    elsif !time_ago_amount.nil? && !time_ago_scale.nil?
      self.date ||= find_date(time_ago_amount, time_ago_scale, Date.today)
      true
    else
      self.date = created_at
      true
    end
    true
  end
end
