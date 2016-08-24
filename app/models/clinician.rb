class Clinician < ActiveRecord::Base
  has_many :patients
  has_many :visits

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
  validates :practice_name,
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
    presence: true
end
