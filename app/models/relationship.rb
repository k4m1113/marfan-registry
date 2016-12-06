class Relationship < ActiveRecord::Base
  has_one :subject, class_name: 'Patient', foreign_key: 'patient_id'
  has_one :relationship_patient, class_name: 'Patient', foreign_key: 'relation_patient_id', inverse_of: :relationship

  accepts_nested_attributes_for :relationship_patient

  validates :seeded_relationship_type_id,
    presence: true,
    numericality: {
      only_integer: true
    }

end
