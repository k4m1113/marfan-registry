class Symptom < ActiveRecord::Base
  has_one :SeededSymptom
  belongs_to :visit, inverse_of: :symptoms
  validates_presence_of :visit

  after_save { |s| s.destroy if s.presence.blank? }
end
