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
  belongs_to :topic

  belongs_to :visit,
    inverse_of: :family_members,
    required: false


  validates :claimed_patient_id,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true
  validates :born_years_ago,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true
end
