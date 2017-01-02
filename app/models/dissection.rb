class Dissection < ActiveRecord::Base

  belongs_to :patient,
    inverse_of: :dissections

  validates :patient,
    presence: true
  validates :concern_type,
    presence: true,
    inclusion: { in: ["Cardiac"] },
    type: { type: :string }
  validates :when,
    presence: true,
    timeliness: { type: :datetime }
  validates :intervention,
    presence: true,
    type: { type: :string }
  validates :location,
    presence: true,
    type: { type: :string }
end
