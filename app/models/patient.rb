class Patient < ActiveRecord::Base
  # belongs_to :clinician
  has_many :visits

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
  validates :month_of_birth,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 12
    }
  validates :day_of_birth,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 31
    }
  validates :year_of_birth,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1900,
      less_than_or_equal_to: 9999
    }
  validates :sex,
    presence: true,
    inclusion: {
      in: ['F', 'M', 'N']
    }
end
