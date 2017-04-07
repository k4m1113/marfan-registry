class Procedure < ActiveRecord::Base
  has_one :gallery

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :procedures
  belongs_to :patient,
    inverse_of: :procedures


  def generate_summary
    if self.note
      return "#{self.topic.name} (#{self.note})"
    else
      "#{self.topic.name} procedure"
    end
  end
end
