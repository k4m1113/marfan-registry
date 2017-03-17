class Test < ActiveRecord::Base
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


  after_save { |t| t.destroy if (t.test_date.nil? && t.time_ago.nil?) || (t.result.blank?) }

  def concat_result
    unless self.test_amount.blank? || self.test_unit_of_meas.blank?
      self.result = "#{self.test_amount} #{self.test_unit_of_meas}"
    end
  end
end
