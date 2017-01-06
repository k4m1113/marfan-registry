class Complication < ActiveRecord::Base
  belongs_to :patient,
    inverse_of: :complications

  has_one :topic_id
end
