class Procedure < ActiveRecord::Base
  has_one :gallery

  belongs_to :topic
  belongs_to :visit,
    inverse_of: :procedures
  belongs_to :patient,
    inverse_of: :procedures


  def generate_summary
    details = "#{self.topic.name.with_indefinite_article} procedure for #{self.topic.parent.name}"
    if self.absolute_start_date
      adm = self.absolute_start_date
      details << " on #{self.absolute_start_date.strftime('%B %Y')}"
    elsif self.time_ago && self.time_ago_scale
      adm = find_date(self.time_ago, self.time_ago_scale, self.created_at)
      details << " in #{adm.strftime('%B %Y')}"
    else
      details << ""
    end
    if self.note
      details << " (#{self.note})"
    end
    return details
  end
end
