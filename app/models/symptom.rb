class Symptom < ActiveRecord::Base
  belongs_to :topic
  belongs_to :visit,
    inverse_of: :symptoms
  belongs_to :patient,
    inverse_of: :symptoms

  after_save { |s| s.destroy if s.presence.nil? }

  validates :presence,
    inclusion: { in: [true, false] },
    allow_nil: true
  validates :measurement,
    numericality: true,
    allow_nil: true


  def generate_summary
  
  end
end
