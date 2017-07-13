class Vital < ApplicationRecord
  attr_accessor :test_amount, :test_unit_of_meas

  before_create :calculate_metric
  after_save { |v| v.destroy if v.measurement.blank? }

  belongs_to :topic
  belongs_to :patient, inverse_of: :vitals, required: true
  belongs_to :visit, inverse_of: :vitals, required: false

  def self.attributes
    %i[visit_id patient_id topic_id vital present test_amount sbp dbp test_unit_of_meas measurement note attachment]
  end

  def generate_summary
    # "#{topic.name} was #{measurement}#{topic.units_of_measurement[0]}"
  end

  def generate_full_summary

  end

  def abbreviated
    "#{topic.name}: #{measurement.to_f.round(1)} #{topic.units_of_measurement[0]}"
  end

  def calculate_metric
    if ['height', 'weight'].include? topic.name
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
      unless self.measurement
        self.measurement = self.test_amount
      end
    end
  end
end
