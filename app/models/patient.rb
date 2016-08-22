class Patient < ActiveRecord::Base
  # belongs_to :clinician
  has_many :visits

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :month_of_birth, presence: true, numericality: {
    only_integer: true
  }
  validates :day_of_birth, presence: true, numericality: {
    only_integer: true
  }
  validates :year_of_birth, presence: true, numericality: {
    only_integer: true
  }
  validates :sex, presence: true, inclusion: {
    in: ['F', 'M', 'N'] }

end
