class Patient < ActiveRecord::Base
  has_many :visits, inverse_of: :patient
  has_many :family_members, inverse_of: :patient
  has_many :tests, inverse_of: :patient

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
