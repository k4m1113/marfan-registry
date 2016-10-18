class Hospitalization < ActiveRecord::Base
  validates :visit, presence: true
  belongs_to :visit, inverse_of: :hospitalizations
end
