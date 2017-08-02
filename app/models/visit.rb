# Visit Class is where it all happens
class Visit < ApplicationRecord
  include Report
  include ActiveSupport::NumberHelper
  include CommonContent
  include ApplicationHelper

  attr_reader :new_concerns

  belongs_to :patient,
             inverse_of: :visits
  belongs_to :clinician,
             inverse_of: :visits

  has_many :diagnoses,
           dependent: :destroy
  has_many :dissections,
           dependent: :destroy
  has_many :family_members,
           dependent: :destroy
  has_many :genetic_tests,
           dependent: :destroy
  has_many :heart_measurements,
           dependent: :destroy
  has_many :hospitalizations,
           dependent: :destroy
  has_many :medications,
           dependent: :destroy
  has_many :procedures,
           dependent: :destroy
  has_many :tests,
           dependent: :destroy
  has_many :vitals,
           dependent: :destroy

  accepts_nested_attributes_for :patient
  accepts_nested_attributes_for :diagnoses,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :dissections,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :family_members,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :genetic_tests,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :heart_measurements,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :hospitalizations,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :medications,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :procedures,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :tests,
                                reject_if: proc { |att|
                                  att.rejectable
                                }
  accepts_nested_attributes_for :vitals,
                                reject_if: proc { |att|
                                  att.rejectable
                                }

  self.per_page = 10

  validates :patient_id,
            presence: true,
            numericality: {
              greater_than: 0,
              only_integer: true
            }
  validates :clinician_id,
            presence: true,
            numericality: {
              greater_than: 0,
              only_integer: true
            }

  def topic_types
    k = {}
    Topic.all.order('id ASC').each do |t|
      k[t.id] = t.topic_type
    end
    JSON.generate(k)
  end

  def tags_for_form
    gallery = Gallery.find(visit_id: id)
    gallery.any? ? gallery : gallery.build
  end

  def concerns
    tests + procedures + diagnoses + hospitalizations + patient.family_members + medications + dissections + vitals + genetic_tests
  end

  def new_concerns
    one_minute = 0.0006944442129629629
    concerns.select { |t| DateTime.now - t.created_at.to_datetime < one_minute }
  end

  def letter_sort_by_topic
    {
      'genetic concerns': concerns.select { |c| c.topic.root.name == 'genetics' },
      'cardiovascular concerns': concerns.select { |c| c.topic.root.name == 'cardiovascular' },
      'morphology/physical findings': concerns.select { |c| c.topic.root.name == 'morphology/physical findings' },
      'pulmonary concerns': concerns.select { |c| c.topic.root.name == 'pulmonary' },
      'orthopedic concerns': concerns.select { |c| c.topic.root.name == 'orthopedic' },
      'ophthalmologic concerns': concerns.select { |c| c.topic.root.name == 'ophthalmologic' },
      'gynecologic/urologic concerns': concerns.select { |c| c.topic.root.name == 'gynecologic/urologic' },
      'obstetric concerns': concerns.select { |c| c.topic.root.name == 'obstetric (pregnancy)' },
      'neurologic concerns': concerns.select { |c| c.topic.root.name == 'neurologic' },
      'gastrointestinal concerns': concerns.select { |c| c.topic.root.name == 'gastrointestinal' }
    }
  end

  def sort_by_topic
    letter_sort_by_topic.merge(
      'family history': concerns.select { |c| c.topic.root.name == 'family history' },
      'medication': concerns.select { |c| c.topic.root.name == 'medication' },
      'heart_measurements': concerns.select { |c| c.topic.topic_type == 'heart_measurement'}
    )
  end

  def sort_by_topic_then_type
    all = sort_by_topic
    all.map { |k, v| [k, v.group_by(&:class)] }.to_h
    k = all.transform_values { |arr|
      arr.group_by(&:class).transform_keys { |key| key.name.pluralize }
    }
    k
  end
end
