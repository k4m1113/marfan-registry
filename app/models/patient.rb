class Patient < ApplicationRecord
  include PgSearch
  include CommonContent

  attr_reader :object_pronoun, :subject_pronoun, :possessive_pronoun, :vitals_show_header, :vitals_by_date, :age

  scope :sorted, (-> { order(last_name: :asc) })

  pg_search_scope :search, against: %i[first_name last_name date_of_birth], using: {
    tsearch: { prefix: true }
  }

  self.per_page = 10

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

  validates :first_name, presence: true, format: {
    with: /\A[a-zA-Z ']+\z/
  }
  validates :last_name, presence: true, format: {
    with: /\A[a-zA-Z ']+\z/
  }
  validates :address_line_1, presence: true
  validates :city, presence: true, format: {
    with: /\A[a-zA-Z ']+\z/
  }
  validates :state, presence: true, format: {
    with: /\A[a-zA-Z ']+\z/
  }
  validates :postal_code, presence: true, numericality: true
  validates :country, presence: true, format: {
    with: /\A[a-zA-Z ']+\z/
  }
  validates :sex, presence: true, inclusion: %w[F M N]
  validates :deceased, inclusion: [true, false]
  validates :cause_of_death, allow_nil: true, allow_blank: true, format: {
    with: /\A[a-zA-Z ']+\z/
  }

  validates :email, presence: true, format: {
    with: /.+@.+\..+/i
  }
  validates :phone_1, presence: true

  def self.perform_search(keyword)
    if keyword.present?
      Patient.search(keyword)
    else
      Patient.all
    end.sorted
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

  def vitals_show_header
    ['Date', 'Height (m)', 'Weight (kg)', 'BP (mmHG)', 'HR (bpm)', 'Temp (°C)']
  end

  def heart_measurements_by_date
    result = heart_measurements.group_by { |m| m.created_at.to_date }
    result
  end

  def vitals_by_date
    result = vitals.group_by(&:visit_id)
    result
  end
end
