class FamilyMember < ActiveRecord::Base
  validates :visit, presence: true
  belongs_to :visit, inverse_of: :family_members
end
