class Symptom < ActiveRecord::Base
  has_one :SeededSymptom
  belongs_to :visit, inverse_of: :symptoms

  after_save { |s| s.destroy if s.presence.nil? }

  def valid_datetime
    errors.add(:start_date, 'must be a valid datetime') if ((DateTime.parse(start_date) rescue ArgumentError) == ArgumentError)
  end

  validate :valid_datetime

  validates :visit_id,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }
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
