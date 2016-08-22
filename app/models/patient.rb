class Patient < ActiveRecord::Base
  # belongs_to :clinician
  has_many :visits

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :month_of_birth, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12
  }
  validates :day_of_birth, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31
  }
  validates :year_of_birth, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1900, less_than_or_equal_to: 9999
  }
  validates :sex, presence: true, inclusion: {
    in: ['F', 'M', 'N'] }

end
