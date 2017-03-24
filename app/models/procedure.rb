class Procedure < ActiveRecord::Base
  has_one :gallery

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :procedures
  belongs_to :patient,
    inverse_of: :procedures
end
