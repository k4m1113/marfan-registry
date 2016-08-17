class Patient < ActiveRecord::Base
  belongs_to :clinician

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true, numericality: {
    only_integer: true,
    less_than_or_equal_to: Time.new }
  validates :sex, presence: true, inclusion: {
    in: ['F', 'M', 'N'] }

end
