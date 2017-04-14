class FamilyMember < ActiveRecord::Base
  include PgSearch
  include ApplicationHelper
  include CommonContent

  scope :sorted, -> { order(created_at: :desc) }

  # before_validation(on: :create) do
  #    self.future_patient_data_hash['death_date'] = find_date(future_patient_data_hash['death_time_ago'], future_patient_data_hash['death_time_ago_scale'], Date.today) if (attribute_present?(future_patient_data_hash['death_time_ago']) && attribute_present?(future_patient_data_hash['death_time_ago_scale']))
  # end

  after_save { |f| f.destroy if (f[:future_patient_data_hash]['first_name'].blank? && f[:date_of_birth].blank? && f[:future_patient_data_hash]['cause_of_death'].blank?) }

  pg_search_scope :search,
    against: [:future_patient_data_hash],
    using: {
      tsearch: { prefix: true }
    }

  self.per_page = 10

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
  self.common_content
  validates :topic_id,
    numericality: {
      only_integer: true
    },
    presence: true,
    inclusion: {
      in: self.family_member_ids
    }
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

    def generate_bio
      def name
        if !self.future_patient_data_hash["first_name"].blank?
          if !self.future_patient_data_hash["last_name"].blank?
            return "#{self.future_patient_data_hash['first_name'].capitalize} #{self.future_patient_data_hash['last_name'].capitalize} (#{self.patient.first_name}'s #{self.topic.name})"
          else
            return "#{self.future_patient_data_hash['first_name'].capitalize} (#{self.patient.first_name}'s #{self.topic.name})"
          end
        else
          return "#{self.patient.first_name}'s unnamed #{self.topic.name}"
        end
      end

      def living_info
        if self.future_patient_data_hash['deceased'].blank?
          dead = nil
        elsif self.future_patient_data_hash['deceased'].to_i === 1
          unless self.future_patient_data_hash['cause_of_death'].blank?
            dead = "died of #{self.future_patient_data_hash['cause_of_death']}"
          end
          if !self.future_patient_data_hash['death_date'].blank?
            # string interpolate '-01' to fit YYYY-MM-DD for Date with fuzzy data
            death_date = (self.future_patient_data_hash['death_date'] + "-01").to_datetime
          elsif !self.future_patient_data_hash['death_time_ago'].blank? && !self.future_patient_data_hash['death_time_ago_scale'].blank?
            death_date = find_date(self.future_patient_data_hash['death_time_ago'], self.future_patient_data_hash['death_time_ago_scale'], self.created_at)
          end
          if self.future_patient_data_hash['born_years_ago']
            age_at_death = death_date.year - (self.created_at - self.future_patient_data_hash['born_years_ago'].years).to_datetime.year
          else
            "unknown"
          end

        elsif self.future_patient_data_hash['deceased'].to_i === 0
          age_at_death = Date.today.year - (self.future_patient_data_hash['date_of_birth'] + '-01').to_datetime.year
          dead = 'is alive'
        end
        return dead + " at approximately #{age_at_death} years old"
      end

      def notes
        if !self.future_patient_data_hash['note'].blank?
          return "(#{self.future_patient_data_hash['note']})"
        else
          return nil
        end
      end

      return %(#{self.name} #{self.living_info}. #{self.notes})
    end
end
