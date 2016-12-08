class FamilyMember < ActiveRecord::Base

  belongs_to :visit, inverse_of: :family_members
  belongs_to :seeded_relationship_type

  validates :visit,
    presence: true
  validates :seeded_relationship_type,
    presence: true
end
