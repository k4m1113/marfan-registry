class Patient < ActiveRecord::Base
  include PgSearch

  scope :sorted, -> { order(last_name: :asc) }

  pg_search_scope :search,
    against: [:first_name, :last_name],
    using: {
      tsearch: { prefix: true }
    }

  def self.perform_search(keyword)
    if keyword.present?
      Patient.search(keyword)
    else
      Patient.all
    end.sorted
  end

  has_many :visits,
    inverse_of: :patient
  validates :first_name,
    presence: true,
    format: { with: /\A[a-zA-Z ']+\z/ }
  validates :last_name,
    presence: true,
    format: { with: /\A[a-zA-Z ']+\z/ }
  validates :address_line_1,
    presence: true
  validates :city,
    presence: true,
    format: { with: /\A[a-zA-Z ']+\z/ }
  validates :state,
    presence: true,
    format: { with: /\A[a-zA-Z ']+\z/ }
  validates :postal_code,
    presence: true,
    numericality: true
  validates :country,
    presence: true,
    format: { with: /\A[a-zA-Z ']+\z/ }
  validates :sex,
    presence: true,
    inclusion: {
      in: ['F', 'M', 'N']
    }
end
