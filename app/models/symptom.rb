class Symptom < ActiveRecord::Base
  has_one :SeededSymptom
  belongs_to :visit, inverse_of: :symptoms

  after_save { |s| s.destroy if s.presence.nil? }
  
  validates :seeded_symptom_id,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }
  validates :presence,
    inclusion: { in: [true, false] },
    allow_nil: true
  validates :measurement,
    numericality: true,
    allow_nil: true
end
