class Visit < ActiveRecord::Base
  include Report

  belongs_to :patient
  belongs_to :visit
  has_many :symptoms, inverse_of: :visit, dependent: :destroy
  accepts_nested_attributes_for :symptoms
end
