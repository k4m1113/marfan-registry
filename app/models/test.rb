class Test < ActiveRecord::Base
  belongs_to :topic
  belongs_to :patient,
    inverse_of: :tests
  validates :time_ago,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true
end
