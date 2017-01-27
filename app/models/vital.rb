class Vital < ActiveRecord::Base
  belongs_to :topic
  belongs_to :patient,
    inverse_of: :vitals

  after_save { |v| v.destroy if v.measurement.empty? }


end
