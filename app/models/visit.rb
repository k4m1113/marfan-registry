class Visit < ActiveRecord::Base
  include Report

  belongs_to :patient
  belongs_to :visit

  @all_symptoms = SeededSymptom.all
  @cardiovascular_symptoms = SeededSymptom.where(systemic_category: "Cardiovascular")
  @dural_symptoms = SeededSymptom.where(systemic_category: "Dural")
  @aural_symptoms = SeededSymptom.where(systemic_category: "Aural")
  @ocular_symptoms = SeededSymptom.where(systemic_category: "Ocular")
  @pulmonary_symptoms = SeededSymptom.where(systemic_category: "Pulmonary")
  @cranial_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Cranium)")
  @feet_and_leg_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Feet & Legs)")
  @general_skeletal_symptoms = SeededSymptom.where(systemic_category: "Skeletal (General)")
  @hand_and_arm_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Hands & Arms)")

  validates :height,
    presence: true,
    numericality: {
      greater_than: 0
    }
  validates :weight,
    presence: true,
    numericality: {
      greater_than: 0
    }
  validates :patient_id,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }
  validates :z_score,
    presence: true,
    numericality: {
      greater_than: 0
    }
  validates :upper_segment,
    numericality: {
      greater_than: 0
    }
  validates :lower_segment,
    numericality: {
      greater_than: 0
    }
  validates :arm_span,
    numericality: {
      greater_than: 0
    }
end
