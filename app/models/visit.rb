# require 'pry'
# Visit Class is where it all happens
class Visit < ActiveRecord::Base
  include HeartImaging
  include ActiveSupport::NumberHelper
  include CommonContent
  include ApplicationHelper

  belongs_to :patient, inverse_of: :visits
  belongs_to :clinician, inverse_of: :visits

  has_one :gallery, inverse_of: :visit

  has_many :family_members, dependent: :destroy
  has_many :hospitalizations, dependent: :destroy
  has_many :tests, dependent: :destroy

  has_many :vitals, dependent: :destroy
  has_many :diagnoses, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :procedures, dependent: :destroy

  accepts_nested_attributes_for :gallery

  accepts_nested_attributes_for :vitals
  accepts_nested_attributes_for :diagnoses, reject_if: proc { |attributes| attributes['present'].nil? }
  accepts_nested_attributes_for :medications
  accepts_nested_attributes_for :procedures

  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :tests
  accepts_nested_attributes_for :family_members

  self.per_page = 10

  validates :patient_id, presence: true, numericality: {
    greater_than: 0,
    only_integer: true
  }
  validates :clinician_id, presence: true, numericality: {
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
    tests + procedures + diagnoses + hospitalizations + family_members + medications + vitals
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
      'vitals': concerns.select { |c| c.topic.root.name == 'vitals' }
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

  def header
    patient = Patient.find(patient_id)

    address = %(\n#{Date.today.strftime('%m %B %Y')}\n\n#{patient.address_line_1 unless patient.address_line_1.blank?})
    [patient.address_line_2, patient.address_line_3].each do |line|
      address += %(\n#{line}) unless line.blank?
    end
    address += %(\n#{patient.city}, #{patient.state} #{patient.country}\n#{patient.postal_code})
    greeting = %(\nTo whom it may concern,
    \nI had the pleasure of meeting #{patient.first_name} in Atlanta at the 33rd annual Marfan Foundation Conference in Atlanta, GA on August 3rd and 4th, 2017 in clinic for a comprehensive patient assessment.)

    %(#{address}
    #{greeting})
  end

  def vitals_paragraph
    patient = Patient.find(patient_id)
    vitals = self.vitals

    phrases = []

    phrases << "a blood pressure of #{vitals.select { |v| v.topic.name == 'SBP' }[0].measurement}/#{vitals.select { |v| v.topic.name == 'DBP' }[0].measurement}" if vitals.select { |v| v.topic.name == 'SBP' }[0]
    phrases << "a pulse of #{vitals.select { |v| v.topic.name == 'heart rate' }[0].measurement}" if vitals.select { |v| v.topic.name == 'heart rate' }[0]
    phrases << "a height of #{vitals.select { |v| v.topic.name == 'height' }[0].measurement.to_f.round(2)}m" if vitals.select { |v| v.topic.name == 'height' }[0]
    phrases << "a weight of #{vitals.select { |v| v.topic.name == 'weight' }[0].measurement.to_f.round(2)}kg" if vitals.select { |v| v.topic.name == 'weight' }[0]
    phrases << "a temperature of #{vitals.select { |v| v.topic.name == 'temperature' }[0].measurement.to_f.round(1)}°C" if vitals.select { |v| v.topic.name == 'temperature' }[0]

    if phrases.empty?
      %(#{patient.first_name} had no vitals measured during this visit.)
    else
      %(#{patient.first_name} was in good health when I saw #{patient.object_pronoun} with #{list_constructor(phrases)}.)
    end
  end

  def family_paragraph
    patient = Patient.find(patient_id)
    family_members = patient.family_members

    if family_members.blank?
      %(A family history was not completed for #{patient.first_name} during #{patient.possessive_pronoun} visit.)
    else
      bios = ""
      family_members.each do |fm|
        bios += "\n#{fm.generate_summary} "
      end
      %(As part of #{patient.first_name}'s comprehensive visit we gathered the following family history: \n#{bios})
    end
  end

  def meds_paragraph
    patient = Patient.find(patient_id)
    meds = patient.medications.select(&:current?)

    if meds.blank?
      %(I did not discuss any medications with #{patient.first_name} during our visit.)
    else
      all_meds = meds.map(&:generate_full_summary)
      %(#{patient.first_name.capitalize}'s medications consist of:
      \n#{list_constructor(all_meds, '', ';')})
    end
  end

  def imagery_paragraph
    common_content
    heart_imaging_locations = heart_imaging_locations

    patient = Patient.find(patient_id)

    results = ''
    imagery = tests.select { |t| heart_imaging_locations.include?(t.topic)}
    if imagery.empty?
      results += "#{patient.first_name} did not undergo any heart imagery as part of our visit."
    else
      echo = imagery.select { |i| i.topic.name == 'echo' }
      mri = imagery.select { |i| i.topic.name == 'MRI' }
      ct = imagery.select { |i| i.topic.name == 'CT' }
      other_meas = imagery - ct - mri - echo
      unless echo.empty?
        echos = []
        echo.each do |e|
          echos << "#{e.topic.parent.name} was #{e.result}"
        end
        results += "#{patient.first_name} underwent an echocardiogram in which #{patient.possessive_pronoun} #{list_constructor(echos)}. "
      end
      unless mri.empty?
        mris = []
        mri.each do |m|
          mris << "#{m.topic.parent.name} was #{m.result}"
        end
        results += "#{patient.first_name} underwent an MRI in which #{patient.possessive_pronoun} #{list_constructor(mris)}. "
      end
      unless ct.empty?
        cts = []
        ct.each do |c|
          cts << "#{c.topic.parent.name} was #{c.result}"
        end
        results += "#{patient.first_name} underwent a CT scan in which #{patient.possessive_pronoun} #{list_constructor(cts)}. "
      end
      unless other_meas.empty?
        others = []
        other_meas.each do |o|
          others << "#{o.topic.name} of #{o.result}"
        end
        results += "#{patient.subject_pronoun.capitalize} had a #{list_constructor(others)}. "
      end
      "#{results}"
    end
  end

  ## Concerns = anything discussed in a visit not incl: family history, vitals, heart imagery, meds.
  def concerns_body
    patient = Patient.find(patient_id)
    concerns = letter_sort_by_topic

    body = ''
    no_instances = []
    concerns.each do |topic, instances|
      if instances.blank?
        no_instances << topic
      else
        body << "\n#{patient.first_name} had #{instances.length} #{topic}: #{list_constructor(instances.map(&:generate_summary))}."
      end
    end
    %(#{body}
    \nAntoine reported no #{list_constructor(no_instances, 'nor')}.)
  end

  def recommendations
    patient = Patient.find(patient_id)
    recs = ''
    if patient.medications
      continue = patient.medications.select(&:current?)
      discontinue = patient.medications - continue
      unless continue.empty?
        summ = list_constructor(continue.map(&:generate_summary), '', ";\n* ")
        recs << " \nWe advise #{patient.first_name} continue to take\n*  #{summ}."
      end
      unless discontinue.empty?
        summ = list_constructor(discontinue.map(&:generate_summary), '', ";\n* ")
        recs << " \nWe advise him to discontinue taking #{summ}."
      end
    end
    summ = recs.blank? ? 'We have no recommendations for further care at this time.' : recs
    %(#{summ})
  end

  def signature
    %(I have assured #{patient.first_name} that the whole clinic team will be available to #{patient.object_pronoun} in case there are any issues that arise in the future. I encouraged #{patient.object_pronoun} to contact me if #{patient.subject_pronoun} has any problems with or is intolerant of any changes we recommended.
    \nIt has been a pleasure to participate in #{patient.first_name.capitalize}'s care. If there are any questions or concerns, please don't hesitate contact us.
    \nSincerely,
    \n#{clinician.first_name} #{clinician.last_name}
    \n#{clinician.practice_name})
  end

  def report
    %(#{header}
    \n#{vitals_paragraph}
    \n#{meds_paragraph}
    \n#{imagery_paragraph}
    \n#{family_paragraph}
    \n#{concerns_body}
    \n#{recommendations}
    \n#{signature})
  end
end
