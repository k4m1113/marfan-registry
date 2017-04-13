class Medication < ActiveRecord::Base
  include ActiveSupport::NumberHelper

  has_one :gallery

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :medications

  validates :name,
    presence: true
  validates :ingestion_method,
    presence: true

  def generate_summary
    summ = "#{self.name.downcase}"
    unless self.topic_id == 66 || self.topic.depth < 1
      summ << ", #{self.topic.parent.name.with_indefinite_article.singularize},"
    end
    if self.common_name.nil?
      summ << " #{self.ingestion_method.downcase.gsub(/^take /, '').gsub(/^place /, '').rstrip.gsub(/\.$/, '')}"
    else
      summ << " at #{number_to_human(self.dose)} #{self.dose_unit_of_measurement} #{self.ingestion_method.downcase.gsub(/^take /, '').gsub(/^place /, '').rstrip.gsub(/\.$/, '')}"
    end
    return summ
  end
end
