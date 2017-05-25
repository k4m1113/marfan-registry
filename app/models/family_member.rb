class FamilyMember < ApplicationRecord
  include PgSearch
  include ApplicationHelper
  include CommonContent
  mount_uploader :attachment, AttachmentUploader

  attr_accessor :age
  attr_reader :table_headings, :table_body

  scope :sorted, (-> { order(created_at: :desc) })

  before_save :age_calc

  after_save { |f| f.destroy if f[:future_patient_data_hash]['first_name'].blank? && f[:date_of_birth].blank? && f[:future_patient_data_hash]['cause_of_death'].blank? }

  pg_search_scope :search,
    against: [:future_patient_data_hash],
    using: {
      tsearch: { prefix: true }
    }

  self.per_page = 10

  Patient.last.common_content
  fam = Patient.last.family_member_ids

  def self.perform_search(keyword)
    if keyword.present?
      FamilyMember.search(keyword)
    else
      FamilyMember.all
    end.sorted
  end

  has_one :gallery,
    inverse_of: :family_member

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
      ['Name', 'Relationship', 'Living?', 'Note', 'Attachments', 'Actions']
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
        'name': "#{print_if_present(future_patient_data_hash['first_name'])} #{print_if_present(future_patient_data_hash['last_name'])}",
        'relationship': topic.name,
        'living': death_info(self),
        'note': print_if_present(future_patient_data_hash['note']),
        'attachment': "#{action_view.render(
          partial: 'layouts/attachment_thumbnails', format: :txt,
          locals: { model: self})}".html_safe,
        'actions': "#{action_view.render(
          partial: 'family_members/link_buttons', format: :txt,
          locals: { fm: self})}".html_safe
      }
    end

    def generate_summary
      def name
        if !future_patient_data_hash["first_name"].blank?
          if !future_patient_data_hash["last_name"].blank?
            return "#{future_patient_data_hash['first_name'].capitalize} #{future_patient_data_hash['last_name'].capitalize} (#{patient.first_name}'s #{topic.name})"
          else
            return "#{future_patient_data_hash['first_name'].capitalize} (#{patient.first_name}'s #{topic.name})"
          end
        else
          return "#{patient.first_name}'s unnamed #{topic.name}"
        end
      end

      def living_info
        if future_patient_data_hash['deceased'].blank?
          dead = nil
        elsif future_patient_data_hash['deceased'].to_i === 1
          unless future_patient_data_hash['cause_of_death'].blank?
            dead = "died of #{future_patient_data_hash['cause_of_death']}"
          end
          if !future_patient_data_hash['death_date'].blank?
            # string interpolate '-01' to fit YYYY-MM-DD for Date with fuzzy data
            death_date = (future_patient_data_hash['death_date'] + "-01").to_datetime
          elsif !future_patient_data_hash['death_time_ago'].blank? && !future_patient_data_hash['death_time_ago_scale'].blank?
            death_date = find_date(future_patient_data_hash['death_time_ago'], future_patient_data_hash['death_time_ago_scale'], created_at)
          end
          if future_patient_data_hash['born_years_ago']
            age_at_death = death_date.year - (created_at - future_patient_data_hash['born_years_ago'].years).to_datetime.year
          else
            "unknown"
          end

        elsif future_patient_data_hash['deceased'].to_i === 0
          age_at_death = Date.today.year - (future_patient_data_hash['date_of_birth'] + '-01').to_datetime.year
          dead = 'is alive'
        end
        return dead + " at approximately #{age_at_death} years old"
      end

      def notes
        if !future_patient_data_hash['note'].blank?
          return "(#{future_patient_data_hash['note']})"
        else
          return nil
        end
      end

      return %(#{name} #{living_info}. #{notes})
    end
end
