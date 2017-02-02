class Test < ActiveRecord::Base
  belongs_to :topic
  belongs_to :visit,
    inverse_of: :tests,
    required: false
  belongs_to :patient,
    inverse_of: :tests

  validates :time_ago,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true

  after_save { |t| t.destroy if t.absolute_start_date.nil? && t.time_ago.nil? }

end
