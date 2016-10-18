class FamilyMember < ActiveRecord::Base
  belongs_to :visit, inverse_of: :family_members

  validates :visit,
    presence: true
  validates :name,
    format: { with: /\A[a-zA-Z ']+\z/ }
    allow_nil: true
  validates :relationship,
    inclusion: { in: ["Mother", "Father", "Dad's sibling", "Mom's sibling", "Paternal Grandmother", "Paternal Grandfather", "Maternal Grandmother", "Maternal Grandfather", "Sister", "Brother", "Son", "Daughter"] }
    allow_nil: true
  validates :age,
    numericality: { greater_than_or_equal_to: 0 }
    allow_nil: true
  validates :living,
    inclusion: { :in => [true, false] }
    allow_nil: true

end
