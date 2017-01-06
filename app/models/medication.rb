class Medication < ActiveRecord::Base
  belongs_to :patient,
    inverse_of :medications

  has_one :topic_id
end
