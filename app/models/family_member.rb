class FamilyMember < ActiveRecord::Base
  belongs_to :patient

  validates_presence_of :patient

  RELATIONSHIP_TYPES = ["Mother", "Father", "Dad's sibling", "Mom's sibling", "Paternal Grandmother", "Paternal Grandfather", "Maternal Grandmother", "Maternal Grandfather", "Sister", "Brother", "Son", "Daughter"]
end
