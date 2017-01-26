class Procedure < ActiveRecord::Base
  belongs_to :topic
  belongs_to :patient,
    inverse_of: :procedures
end
