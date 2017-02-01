class Diagnosis < ActiveRecord::Base
  belongs_to :topic
  belongs_to :visit,
    inverse_of: :diagnoses,
    required: false
  belongs_to :patient,
    inverse_of: :diagnoses
end
