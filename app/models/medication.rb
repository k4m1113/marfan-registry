class Medication < ActiveRecord::Base
  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :medications
end
