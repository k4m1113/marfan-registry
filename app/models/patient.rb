class Patient < ApplicationRecord
  include PgSearch
  include CommonContent

  attr_reader :object_pronoun,
              :subject_pronoun,
              :possessive_pronoun,
              :vitals_show_header,
              :vitals_by_date,
              :age,
              :full_name

  scope :sorted, (-> { order(last_name: :asc) })

  pg_search_scope :search,
                  against: %i[first_name last_name date_of_birth],
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }

  self.per_page = 20

  has_one :gallery, inverse_of: :patient

  has_many :visits, inverse_of: :patient
  has_many :vitals, dependent: :destroy

  has_many :dissections, dependent: :destroy
  has_many :genetic_tests, dependent: :destroy
  has_many :heart_measurements, dependent: :destroy

  has_many :family_members, dependent: :destroy
  has_many :hospitalizations, dependent: :destroy
  has_many :tests, dependent: :destroy

  has_many :diagnoses, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :procedures, dependent: :destroy

  accepts_nested_attributes_for :gallery

  accepts_nested_attributes_for :vitals
  accepts_nested_attributes_for :diagnoses
  accepts_nested_attributes_for :medications
  accepts_nested_attributes_for :procedures

  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :tests
  accepts_nested_attributes_for :family_members

  validates :first_name,
            presence: true,
            format: {
              with: /\A[a-zA-Z ']+\z/
            }
  validates :last_name,
            presence: true,
            format: {
              with: /\A[a-zA-Z ']+\z/
            }
  validates :address_line_1,
            presence: true
  validates :city,
            presence: true,
            format: {
              with: /\A[a-zA-Z ']+\z/
            }
  validates :state,
            presence: true,
            format: {
              with: /\A[a-zA-Z ']+\z/
            }
  validates :postal_code,
            presence: true,
            numericality: true
  validates :country,
            presence: true,
            format: {
              with: /\A[a-zA-Z ']+\z/
            }
  validates :sex,
            presence: true,
            inclusion: %w[F M N]
  validates :cause_of_death,
            allow_nil: true,
            allow_blank: true,
            format: {
              with: /\A[a-zA-Z ']+\z/
            }

  validates :email,
            presence: true,
            format: {
              with: /.+@.+\..+/i
            }
  validates :phone_1,
            presence: true

  def self.perform_search(keyword)
    if keyword.present?
      Patient.search(keyword)
    else
      Patient.all
    end.sorted
  end

  def exists_as_family_member
    if FamilyMember.select{ |f| f.future_patient_data_hash["first_name"] =~ Regexp.new(first_name, 'i') && f.future_patient_data_hash["last_name"] =~ Regexp.new(last_name, 'i')}
      output = FamilyMember.select{ |f| f.future_patient_data_hash["first_name"] =~ Regexp.new(first_name, 'i') && f.future_patient_data_hash["last_name"] =~ Regexp.new(last_name, 'i')}[0]
    else
      output = false
    end
    output
  end

  def age
    if deceased?
      'deceased'
    else
      age = (((Date.today - date_of_birth.to_date)/365).to_f).round()
      "#{age} y/o"
    end
  end

  def object_pronoun
    if sex == 'F'
      'her'
    elsif sex == 'M'
      'him'
    else
      'them'
    end
  end

  def subject_pronoun
    if sex == 'F'
      'she'
    elsif sex == 'M'
      'he'
    else
      'they'
    end
  end

  def possessive_pronoun
    if sex == 'F'
      'her'
    elsif sex == 'M'
      'his'
    else
      'their'
    end
  end

  def full_name
    "#{last_name}, #{first_name} #{middle_name unless middle_name.nil?}"
  end

  def vitals_show_header
    ['Date', 'Height (m)', 'Weight (kg)', 'SBP (mmHG)', 'DBP (mmHG)', 'HR (bpm)', 'Temp (°C)']
  end

  def heart_measurements_by_date
    heart_measurements.group_by { |m| m.created_at.to_date }
  end

  def vitals_by_date
    vitals.group_by(&:visit_id)
  end

  def concerns
    tests + procedures + diagnoses + hospitalizations + family_members + medications + dissections + vitals + genetic_tests
  end

  def letter_sort_by_topic
    {
      'genetic concerns': concerns.select { |c| c.topic.root.name == 'genetics' },
      'cardiovascular concerns': concerns.select { |c| c.topic.root.name == 'cardiovascular' },
      'morphology/physical findings': concerns.select { |c| c.topic.root.name == 'morphology/physical findings' },
      'pulmonary concerns': concerns.select { |c| c.topic.root.name == 'pulmonary' },
      'orthopedic concerns': concerns.select { |c| c.topic.root.name == 'orthopedic' },
      'ophthalmologic concerns': concerns.select { |c| c.topic.root.name == 'ophthalmologic' },
      'gynecologic/urologic concerns': concerns.select { |c| c.topic.root.name == 'gynecologic/urologic' },
      'obstetric concerns': concerns.select { |c| c.topic.root.name == 'obstetric (pregnancy)' },
      'neurologic concerns': concerns.select { |c| c.topic.root.name == 'neurologic' },
      'gastrointestinal concerns': concerns.select { |c| c.topic.root.name == 'gastrointestinal' }
    }
  end

  def sort_by_topic
    letter_sort_by_topic.merge(
      'family history': concerns.select { |c| c.topic.root.name == 'family history' },
      'medication': concerns.select { |c| c.topic.root.name == 'medication' },
      'vitals': concerns.select { |c| c.topic.root.name == 'vitals' },
      'heart_measurements': concerns.select { |c| c.topic.topic_type == 'heart_measurement'},
      'lifestyle': concerns.select { |c| c.topic.root.name == 'lifestyle' },
    )
  end

  def sort_by_topic_then_type
    all = sort_by_topic
    all.map { |k, v| [k, v.group_by(&:class)] }.to_h
    k = all.transform_values { |arr|
      arr.group_by(&:class).transform_keys { |key| key.name.pluralize }
    }
    k
  end
end
