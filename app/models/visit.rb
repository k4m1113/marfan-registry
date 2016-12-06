class Visit < ActiveRecord::Base
  include Report

  self.per_page = 10

  belongs_to :patient,
    inverse_of: :visits
  belongs_to :clinician
  has_many :symptoms,
    inverse_of: :visit,
    dependent: :destroy
  has_many :hospitalizations,
    inverse_of: :visit,
    dependent: :destroy
  has_many :tests,
    inverse_of: :visit,
    dependent: :destroy

  accepts_nested_attributes_for :symptoms
  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :tests

  validates :patient_id,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }
  validates :clinician_id,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }
  validates :weight,
    numericality: { greater_than: 0 },
    allow_nil: true
  validates :height,
    numericality: { greater_than: 0 },
    allow_nil: true
  validates :z_score,
    numericality: { greater_than: 0 },
    allow_nil: true
  validates :upper_segment,
    numericality: { greater_than: 0 },
    allow_nil: true
  validates :lower_segment,
    numericality: { greater_than: 0 },
    allow_nil: true
  validates :arm_span,
    numericality: { greater_than: 0 },
    allow_nil: true
end
