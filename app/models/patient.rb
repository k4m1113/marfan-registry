class Patient < ActiveRecord::Base
  include PgSearch

  scope :sorted, -> { order(last_name: :asc) }

  pg_search_scope :search,
    against: [:first_name, :last_name],
    using: {
      tsearch: { prefix: true }
    }

  self.per_page = 10

  def self.perform_search(keyword)
    if keyword.present?
      Patient.search(keyword)
    else
      Patient.all
    end.sorted
  end

  has_many :visits,
    inverse_of: :patient

  has_many :dissections,
    dependent: :destroy


  has_many :symptoms,
    dependent: :destroy
  has_many :family_members,
    dependent: :destroy
  has_many :hospitalizations,
    dependent: :destroy
  has_many :tests,
    dependent: :destroy

  has_many :complications,
    dependent: :destroy
  has_many :diagnoses,
    dependent: :destroy
  has_many :medications,
    dependent: :destroy
  has_many :procedures,
    dependent: :destroy

  accepts_nested_attributes_for :complications
  accepts_nested_attributes_for :diagnoses
  accepts_nested_attributes_for :medications
  accepts_nested_attributes_for :procedures

  accepts_nested_attributes_for :dissections
  accepts_nested_attributes_for :symptoms
  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :tests
  accepts_nested_attributes_for :family_members

  validates :first_name,
    format: { with: /\A[a-zA-Z ']+\z/ },
    allow_nil: true,
    allow_blank: true
  validates :last_name,
    format: { with: /\A[a-zA-Z ']+\z/ },
    allow_nil: true,
    allow_blank: true
  validates :city,
    format: { with: /\A[a-zA-Z ']+\z/ },
    allow_nil: true,
    allow_blank: true
  validates :state,
    format: { with: /\A[a-zA-Z ']+\z/ },
    allow_nil: true,
    allow_blank: true
  validates :postal_code,
    numericality: true,
    allow_nil: true,
    allow_blank: true
  validates :country,
    format: { with: /\A[a-zA-Z ']+\z/ },
    allow_nil: true,
    allow_blank: true
  validates :sex,
    presence: true,
    inclusion: ['F', 'M', 'N']
  validates :deceased,
    inclusion: [true, false],
    allow_nil: true,
    allow_blank: true
  validates :cause_of_death,
    format: { with: /\A[a-zA-Z ']+\z/ },
    allow_nil: true,
    allow_blank: true
  validates :email,
    format: { with: /.+@.+\..+/i },
    allow_blank: true
  validates :phone_1,
    format: { with: /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, multiline: true },
    allow_blank: true
end
