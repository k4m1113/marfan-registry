class Visit < ActiveRecord::Base
  belongs_to :patient
  has_many :symptoms

  REASONS_FOR_VISIT = ["Family history", "Hospitalization", "Genetic testing", "Chest pain", "Checkup"]

  validates :height, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :patient, presence: true
  validates :z_score, presence: true, numericality: true
  validates :upper_segment, numericality: true
  validates :lower_segment, numericality: true
  validates :arm_span, numericality: true
end
