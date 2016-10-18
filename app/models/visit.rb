class Visit < ActiveRecord::Base
  include Report

  belongs_to :patient, inverse_of: :visits
  has_many :symptoms, inverse_of: :visit, dependent: :destroy
  has_many :hospitalizations, inverse_of: :visit
  has_many :family_members, inverse_of: :visit
  has_many :tests, inverse_of: :visit

  accepts_nested_attributes_for :symptoms
  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :family_members
  accepts_nested_attributes_for :patient
  accepts_nested_attributes_for :tests
end
