class Visit < ActiveRecord::Base
  include Report

  belongs_to :patient
  has_many :symptoms, inverse_of: :visit, dependent: :destroy
  has_many :hospitalizations
  has_many :family_members, through: :patient

  accepts_nested_attributes_for :symptoms
  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :family_members
  accepts_nested_attributes_for :patient
end
