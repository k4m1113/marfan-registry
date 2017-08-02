class FamilyMember < ApplicationRecord
  include PgSearch
  include ApplicationHelper
  include CommonContent
  mount_uploader :attachment, AttachmentUploader

  attr_accessor :age,
                :concerns,
                :full_name
  attr_reader :table_headings,
              :table_body

  scope :sorted, (-> { order(created_at: :desc) })

  before_save :age_calc,
              :concerns_to_note

  after_save { |f| f.destroy if                 f[:future_patient_data_hash]['first_name'].blank? && f[:date_of_birth].blank? && f[:future_patient_data_hash]['cause_of_death'].blank? }

  pg_search_scope :search,
                  against: [:future_patient_data_hash],
                  using: {
                    tsearch: { prefix: true }
                  }

  self.per_page = 10

  Patient.last.common_content
  fam = Patient.last.family_member_ids

  def self.attributes
    [:visit_id, :patient_id, :topic_id, :future_patient_data_hash, :family_member, :claimed_patient_id,  :attachment, concerns: [], future_patient_data_hash:
      %i[first_name last_name born_years_ago date_of_birth deceased death_time_ago death_time_ago_scale death_date cause_of_death note]]
  end

  def self.perform_search(keyword)
    if keyword.present?
      FamilyMember.search(keyword)
    else
      FamilyMember.all
    end.sorted
  end

  belongs_to :patient,
             inverse_of: :family_members
  belongs_to :topic

  belongs_to :visit,
             inverse_of: :family_members,
             required: false
  validates :topic_id,
            numericality: {
              only_integer: true
            },
            presence: true,
            inclusion: fam
  validates :claimed_patient_id,
            numericality: {
              only_integer: true,
              greater_than: 0
            },
            allow_nil: true
  validates :born_years_ago,
            numericality: {
              only_integer: true,
              greater_than: 0
            },
            allow_nil: true

  def self.table_headings
    ['Name', 'Relationship', 'Note', 'Attachments', 'Actions']
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

    {
      'name': "#{print_if_present(future_patient_data_hash['first_name'])} #{print_if_present(future_patient_data_hash['last_name'])}",
      'relationship': topic.name,
      'note': "#{print_if_present(future_patient_data_hash['note'])}; #{print_if_present(note)}",
      'attachment': action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self }
      ).to_s.html_safe,
      'actions': action_view.render(
        partial: 'family_members/link_buttons',
        format: :txt,
        locals: { fm: self }
      ).to_s.html_safe
    }
  end

  def age_calc

  end

  def full_name
    "#{future_patient_data_hash['first_name'] unless future_patient_data_hash['first_name'].blank?} #{future_patient_data_hash['last_name'] unless future_patient_data_hash['last_name'].blank?}"
  end
  def concerns_to_note
    if !concerns.blank?
      topics = concerns.map{ |c| Topic.find(c.to_i).name }

      self.note = topics.join(', ')
    end
  end

  def generate_summary
    def name
      if !future_patient_data_hash["first_name"].blank?
        if !future_patient_data_hash["last_name"].blank?
           "#{future_patient_data_hash['first_name'].capitalize} #{future_patient_data_hash['last_name'].capitalize} (#{patient.first_name}'s #{topic.name})"
        else
          "#{future_patient_data_hash['first_name'].capitalize} (#{patient.first_name}'s #{topic.name})"
        end
      else
        "#{patient.first_name}'s unnamed #{topic.name}"
      end
    end

    %(#{name})
  end
  def generate_full_summary
    def notes
      if !future_patient_data_hash['note'].blank?
        "(#{future_patient_data_hash['note']})"
      else
        nil
      end
    end
    def death_info
      dead = ''
      if !future_patient_data_hash['cause_of_death'].blank?
        dead = "deceased of #{future_patient_data_hash['cause_of_death']}"
      end
      if !future_patient_data_hash['born_years_ago'].blank?
        if !dead.blank?
          dead += " at #{future_patient_data_hash['born_years_ago']} years of age"
        else
          dead += "is approximately #{future_patient_data_hash['born_years_ago']} years old at time of visit"
        end
      end
      dead
    end
    %(#{generate_summary}, #{death_info} #{notes}.)
  end
end
