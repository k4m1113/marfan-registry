class Complication < ActiveRecord::Base
  include ApplicationHelper

  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :complications

  def generate_summary
    return "#{self.note.with_indefinite_article} of #{find_pretty_trail(self.topic_id)}"
  end
end
