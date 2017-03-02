class Vital < ActiveRecord::Base
  attr_accessor :test_amount, :test_unit_of_meas

  before_save :calculate_metric

  belongs_to :topic
  belongs_to :patient,
    inverse_of: :vitals
  belongs_to :visit,
    inverse_of: :vitals,
    required: false

  after_save { |v| v.destroy if v.measurement.empty? }

  def calculate_metric
    if ['height', 'weight'].include? self.topic.name
      unless self.test_amount.blank? || self.test_unit_of_meas.blank?
        unit = Unit.new("#{self.test_amount} #{self.test_unit_of_meas}")
        self.measurement = unit.base.scalar.to_f.round(3)
      end
    elsif (self.topic.name == 'temperature') && (self.test_unit_of_meas == '°F')
      unless self.test_amount.blank? || self.test_unit_of_meas.blank?
        unit = Unit.new("#{self.test_amount} tempF").convert_to('tempC')
        self.measurement = unit.scalar.to_f.round(3)
      end
    else
      self.measurement = self.test_amount
    end
  end
end
