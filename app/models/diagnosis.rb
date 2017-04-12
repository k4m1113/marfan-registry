class Diagnosis < ActiveRecord::Base
  include ApplicationHelper

  has_one :gallery

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :diagnoses,
    required: false
  belongs_to :patient,
    inverse_of: :diagnoses

  validates :note,
    presence: true

  def generate_summary
    return "#{self.note.with_indefinite_article} of #{find_pretty_trail(self.topic_id)}"
  end
end
