# class for genetic test result
class GeneticTest < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  before_create :timeify, :concat_transcript, :concat_protein, :concat_variant

  # ATTRIBUTES
  attr_accessor :time_ago_amount, :time_ago_scale, :absolute_start_date, :present, :concat_note

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
  validates :lab_classification,
            presence: true,
            inclusion: {
              in: ['pathogenic', 'likely pathogenic', 'VUS likely disease-causing', 'VUS', 'VUS likely benign', 'likely benign', 'benign', 'consistent with clinical diagnosis']
            }
  validates :clinical_classification,
            allow_nil: true,
            inclusion: {
              in: ['pathogenic', 'likely pathogenic', 'VUS likely disease-causing', 'VUS', 'VUS likely benign', 'likely benign', 'benign', 'consistent with clinical diagnosis']
            }

  # INSTANCE METHODS
  def generate_summary
    "positive diagnosis for #{lab_classification} variant of #{topic.name} gene"
  end

  def generate_full_summary
    details = ['genetic diagnosis for']
    details << "#{lab_classification} variant of #{topic.name} gene"
    details << "by #{lab_name}" if lab_name
    details << "in #{date.strftime('%b %Y')}" if date
    details << "(#{concatted_note})" if concatted_note
    details.join(' ')
  end

  def self.attributes
    %i[visit_id topic_id patient_id present time_ago_amount time_ago_scale absolute_start_date transcript protein variant exons lab_name lab_classification clinical_classification predictive_testing_recommended note attachment]
  end

  # TABLE VIEW ATTRIBUTES
  def self.table_headings
    %w[Date Gene Lab Classification Note Attachment Actions]
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

    return {
      'date': print_if_present(self.date),
      'gene': topic.name,
      'lab': print_if_present(lab_name),
      'classification': print_if_present(lab_classification),
      'note': print_if_present(concatted_note),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self })}".html_safe,
      'actions': "#{action_view.render(
        partial: 'genetic_tests/link_buttons', format: :txt,
        locals: { t: self})}".html_safe
    }
  end

  private

  # BEFORE SAVE
  # hard-code fuzzy date data
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

  # add 'NM_' to beginning of transcript
  def concat_transcript
    self.transcript = transcript.insert(0, 'NM_') if transcript
  end

  # add 'p.' to beginning of protein
  def concat_protein
    self.protein = protein.insert(0, 'p.') if protein
  end

  # add 'c.' to beginning of variant
  def concat_variant
    self.variant = variant.insert(0, 'c.') if variant
  end

  # add predictive testing recommendation to note
  def concatted_note
    if note && predictive_testing_recommended
      "#{note}; predictive testing recommended"
    elsif note && predictive_testing_recommended.nil?
      note
    elsif note.nil? && predictive_testing_recommended
      'predictive testing recommended'
    end
  end
end
