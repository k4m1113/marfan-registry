class Complication < ActiveRecord::Base
  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :complications

  def generate_summary
    return "#{self.note.with_indefinite_article} of #{self.topic.name}"
  end
end
