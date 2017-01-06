class Diagnosis < ActiveRecord::Base
  belongs_to :patient,
    inverse_of: :diagnoses

  has_one :topic_id
end
