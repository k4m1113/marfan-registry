class Procedure < ActiveRecord::Base
  belongs_to :patient,
    inverse_of: :procedures

  has_one :topic_id
end
