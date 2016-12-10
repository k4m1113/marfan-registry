class FamilyMember < ActiveRecord::Base
  include PgSearch

  scope :sorted, -> { order(created_at: :desc) }

  pg_search_scope :search,
    against: [:future_patient_data_hash],
    using: {
      tsearch: { prefix: true }
    }

  self.per_page = 10

  def self.perform_search(keyword)
    if keyword.present?
      FamilyMember.search(keyword)
    else
      FamilyMember.all
    end.sorted
  end

  belongs_to :patient,
    inverse_of: :family_members
  belongs_to :seeded_relationship_type
  validates :seeded_relationship_type,
    presence: true

  validates :claimed_patient_id,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true
end
