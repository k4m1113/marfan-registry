class SeededSymptom < ActiveRecord::Base
  ## 'Seeded Symptoms' refer to hard-coded data in db/seeds.rb
  ## DO NOT MODIFY DATA OR RELATED CODE
  SYSTEMIC_CATEGORIES = ["Cardiovascular", "Dura", "Aural", "Ocular", "Pulmonary", "Integumentary", "Skeletal (Cranium)", "Skeletal (Feet & Legs)", "Skeletal (General)", "Skeletal (Hands & Arms)"].freeze

  validates :name, presence: true
  validates :common_name, presence: true
  validates :systemic_category, presence: true
  validates :systemic_category, inclusion: { in: SYSTEMIC_CATEGORIES }
  validates :description, presence: true
  validates :plural, presence: true
  validates :unit_of_measurement, presence: true
end
