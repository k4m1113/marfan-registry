class SeededSymptom < ActiveRecord::Base
  belongs_to :symptom

  ## 'Seeded Symptoms' refer to hard-coded data in db/seeds.rb
  ## DO NOT MODIFY DATA OR RELATED CODE
  SYSTEMIC_CATEGORIES = ["Cardiovascular", "Dural", "Aural", "Ocular", "Pulmonary", "Integumentary", "Skeletal (Cranium)", "Skeletal (Feet & Legs)", "Skeletal (General)", "Skeletal (Hands & Arms)"].freeze

  validates :name,
    presence: true
  validates :common_name,
    presence: true
  validates :plural,
    presence: true
  validates :article,
    presence: true
  validates :systemic_category,
    presence: true,
    inclusion: { in: SYSTEMIC_CATEGORIES }
  validates :beighton_value,
    presence: true,
    numericality: { only_integer: true }
  validates :ghent_value,
    presence: true,
    numericality: { only_integer: true }
end
