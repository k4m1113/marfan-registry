class Diagnosis < ActiveRecord::Base
  has_one :gallery

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :diagnoses,
    required: false
  belongs_to :patient,
    inverse_of: :diagnoses

  def generate_summary
    if self.note == "presence"
      return "a presence of #{self.topic.name}"
    else
      return "an absence of #{self.topic.name}"
    end
  end
end
