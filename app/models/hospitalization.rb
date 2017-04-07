class Hospitalization < ActiveRecord::Base
  include ApplicationHelper
  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :hospitalizations

  validates :visit_id,
    numericality: {
      only_integer: true,
      greater_than: 0
    },
    allow_nil: true
  validates :length_of_stay,
    numericality: { greater_than: 0 },
    allow_nil: true

  def generate_summary
    if self.note
      return "#{self.topic.name} (#{self.note})"
    else
      "#{self.topic.name} procedure"
    end
  end
end
