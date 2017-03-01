class Vital < ActiveRecord::Base
  attr_accessor :test_amount, :test_unit_of_meas

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :vitals

  after_save { |v| v.destroy if v.measurement.empty? }

  def calculate_metric
    unless self.test_amount.blank? || self.test_unit_of_meas.blank?
      unit = Unit.new("#{self.test_amount} #{self.test_unit_of_meas}")
      self.measurement = unit.base.scalar.to_f.round(3)
    end
  end
end
