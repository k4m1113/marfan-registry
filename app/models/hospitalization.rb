class Hospitalization < ActiveRecord::Base
  belongs_to :visit, inverse_of: :hospitalizations

  # validates :visit_id,
  #   presence: true,
  #   numericality: {
  #     only_integer: true,
  #     greater_than: 0
  #   }
  validates :length_of_stay,
    numericality: { greater_than: 0 },
    allow_nil: true
end
