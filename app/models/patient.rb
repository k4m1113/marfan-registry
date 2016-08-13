class Patient < ActiveRecord::Base
  belongs_to :clinician

  validates :first_name, presence: true
  validates :last_name, presence: true
end
