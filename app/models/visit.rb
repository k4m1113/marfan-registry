class Visit < ActiveRecord::Base
  include Report

  belongs_to :patient
  belongs_to :visit
  has_many :symptoms, inverse_of: :visit
  accepts_nested_attributes_for :symptoms

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
