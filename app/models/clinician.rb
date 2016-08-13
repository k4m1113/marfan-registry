class Clinician < ActiveRecord::Base
  has_many :patients
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
