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

  belongs_to :seeded_relationship_type,
    inverse_of: :patients

  has_many :visits,
    inverse_of: :patient

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

end
