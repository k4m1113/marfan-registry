class Test < ActiveRecord::Base
  include ApplicationHelper
  attr_accessor :test_amount, :test_unit_of_meas

  before_save :concat_result

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

  has_one :gallery

  accepts_nested_attributes_for :gallery

  after_save { |t| t.destroy if (t.test_date.nil? && t.time_ago.nil?) || (t.result.blank?) }

  def concat_result
    unless self.test_amount.blank? || self.test_unit_of_meas.blank?
      self.result = "#{self.test_amount} #{self.test_unit_of_meas}"
    end
  end
  
  def generate_summary
    if self.test_date
      test_date = self.test_date
    elsif self.time_ago && self.time_ago_scale
      test_date = find_date(self.time_ago, self.time_ago_scale, self.created_at)
    else
      test_date = self.created_at
    end
    if Topic.roots.include?(self.topic.parent)
      descriptor = "#{self.topic.name}"
    else
      descriptor = "#{self.topic.name} for #{self.topic.parent.name}"
    end
    return "#{descriptor} was #{self.result}"
  end
end
