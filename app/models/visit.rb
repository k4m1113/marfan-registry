require 'pry'
class Visit < ActiveRecord::Base
  include Report
  include ActiveSupport::NumberHelper
  include CommonContent
  include ApplicationHelper

  belongs_to :patient,
    inverse_of: :visits
  belongs_to :clinician,
    inverse_of: :visits

  has_one :gallery,
    inverse_of: :visit

  has_many :symptoms,
    dependent: :destroy
  has_many :family_members,
    dependent: :destroy
  has_many :hospitalizations,
    dependent: :destroy
  has_many :tests,
    dependent: :destroy

  has_many :vitals,
    dependent: :destroy
  has_many :complications,
    dependent: :destroy
  has_many :diagnoses,
    dependent: :destroy
  has_many :medications,
    dependent: :destroy
  has_many :procedures,
    dependent: :destroy

  accepts_nested_attributes_for :gallery

  accepts_nested_attributes_for :complications
  accepts_nested_attributes_for :vitals
  accepts_nested_attributes_for :diagnoses
  accepts_nested_attributes_for :medications
  accepts_nested_attributes_for :procedures

  accepts_nested_attributes_for :symptoms
  accepts_nested_attributes_for :hospitalizations
  accepts_nested_attributes_for :tests
  accepts_nested_attributes_for :family_members

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

  def tags_for_form
    gallery = Gallery.find(visit_id: id)
    gallery.any? ? gallery : gallery.build
  end

  def concerns
    return self.tests + self.procedures + self.complications + self.diagnoses + self.symptoms + self.hospitalizations
  end

  def sort_by_topic
    return {
      "genetic concerns": self.concerns.select{|c| c.topic.root.name == "genetics" },
      "cardiovascular concerns": self.concerns.select{|c| c.topic.root.name == "cardiovascular" },
      "morphology/physical findings": self.concerns.select{|c| c.topic.root.name == "morphology/physical findings"},
      "pulmonary concerns": self.concerns.select{|c| c.topic.root.name == "pulmonary"},
      "orthopedic concerns": self.concerns.select{|c| c.topic.root.name == "orthopedic"},
      "ophthalmologic concerns": self.concerns.select{|c| c.topic.root.name == "ophthalmologic"},
      "gynecologic/urologic concerns": self.concerns.select{|c| c.topic.root.name == "gynecologic/urologic"},
      "obstetric concerns": self.concerns.select{|c| c.topic.root.name == "obstetric (pregnancy)"},
      "neurologic concerns": self.concerns.select{|c| c.topic.root.name == "neurologic"},
      "gastrointestinal concerns": self.concerns.select{|c| c.topic.root.name == "gastrointestinal"}
    }
  end

  def header
    patient = Patient.find(self.patient_id)

    address = %(\n#{Date.today.strftime('%m %B %Y')}\n\n#{patient.address_line_1 unless patient.address_line_1.blank?})
    [patient.address_line_2, patient.address_line_3].each do |line|
      address += %(\n#{line}) unless line.blank?
    end
    address += %(\n#{patient.city}, #{patient.state} #{patient.country}\n#{patient.postal_code})
    greeting = %(\nTo whom it may concern,
    \nI had the pleasure of meeting #{patient.first_name} in Atlanta at the 33rd annual Marfan Foundation Conference in Atlanta, GA on August 3rd and 4th, 2017 in clinic for a comprehensive patient assessment.)
    return %(#{address}
    #{greeting})
  end

  def vitals_paragraph
    patient = Patient.find(self.patient_id)
    vitals = self.vitals

    phrases = []

    phrases << "a blood pressure of #{vitals.select{|v| v.topic.name == 'SBP'}[0].measurement}/#{vitals.select{|v| v.topic.name == 'DBP'}[0].measurement}" if vitals.select{|v| v.topic.name == 'SBP'}[0]
    phrases << "a pulse of #{vitals.select{|v| v.topic.name == 'heart rate'}[0].measurement}" if vitals.select{|v| v.topic.name == 'heart rate'}[0]
    phrases << "a height of #{vitals.select{|v| v.topic.name == 'height'}[0].measurement.to_f.round(2)}m" if vitals.select{|v| v.topic.name == 'height'}[0]
    phrases << "a weight of #{vitals.select{|v| v.topic.name == 'weight'}[0].measurement.to_f.round(2)}kg" if vitals.select{|v| v.topic.name == 'weight'}[0]
    phrases << "a temperature of #{vitals.select{|v| v.topic.name == 'temperature'}[0].measurement.to_f.round(1)}°C" if vitals.select{|v| v.topic.name == 'temperature'}[0]

    if phrases.empty?
      return %(#{patient.first_name} had no vitals measured during this visit.)
    else
      return %(#{patient.first_name} was in good health when I saw #{patient.object_pronoun} with #{list_constructor(phrases)}.)
    end
  end

  def family_paragraph
    patient = Patient.find(self.patient_id)
    family_members = patient.family_members

    if family_members.blank?
      return %(A family history was not completed for #{patient.first_name} during #{patient.possessive_pronoun} visit.)
    else
      bios = ""
      family_members.each do |fm|
        bios += "\n#{fm.generate_bio} "
      end
      return %(As part of #{patient.first_name}'s comprehensive visit we gathered the following family history: \n#{bios})
    end
  end

  def meds_paragraph
    patient = Patient.find(self.patient_id)
    meds = self.patient.medications.select{|m| m.current?}

    if meds.blank?
      return %(I did not discuss any medications with #{patient.first_name} during our visit.)
    else
      all_meds = meds.map{|m| m.generate_summary}
      return %(#{patient.first_name.capitalize}'s medications consist of:
      \n#{list_constructor(all_meds, '', ';')})
    end
  end

  def imagery_paragraph
    self.common_content
    heart_imaging_locations = self.heart_imaging_locations

    patient = Patient.find(self.patient_id)

    results = ""
    imagery = self.tests.select{|t| heart_imaging_locations.include?(t.topic)}
    if imagery.empty?
      results += "#{self.patient.first_name} did not undergo any heart imagery as part of our visit."
    else
      echo = imagery.select{|i| i.topic.name === "echo" }
      mri = imagery.select{|i| i.topic.name === "MRI" }
      ct = imagery.select{|i| i.topic.name === "CT" }
      other_meas = imagery - ct - mri - echo
      unless echo.empty?
        echos = []
        echo.each do |e|
          echos << "#{e.topic.parent.name} was #{e.result}"
        end
        results += "#{self.patient.first_name} underwent an echocardiogram in which #{self.patient.possessive_pronoun} #{list_constructor(echos)}. "
      end
      unless mri.empty?
        mris = []
        mri.each do |m|
          mris << "#{m.topic.parent.name} was #{m.result}"
        end
        results += "#{self.patient.first_name} underwent an MRI in which #{self.patient.possessive_pronoun} #{list_constructor(mris)}. "
      end
      unless ct.empty?
        cts = []
        ct.each do |c|
          cts << "#{c.topic.parent.name} was #{c.result}"
        end
        results += "#{self.patient.first_name} underwent a CT scan in which #{self.patient.possessive_pronoun} #{list_constructor(cts)}. "
      end
      unless other_meas.empty?
        others = []
        other_meas.each do |o|
          others << "#{o.topic.name} of #{o.result}"
        end
        results += "#{self.patient.subject_pronoun.capitalize} had a #{list_constructor(others)}. "
      end
      return "#{results}"
    end
  end

  ## Concerns = anything discussed in a visit not incl: family history, vitals, heart imagery.
  def concerns_body
    patient = Patient.find(self.patient_id)
    concerns = self.sort_by_topic

    body = ""
    no_instances = []
    self.sort_by_topic.each do |topic, instances|
      if instances.blank?
        no_instances << topic
      else
        body << "\n#{self.patient.first_name} had #{instances.length} #{topic}: #{list_constructor(instances.map{|instance| instance.generate_summary})}."
      end
    end
    return %(#{body}
    \nAntoine reported no #{list_constructor(no_instances, "nor")}.)
  end

  def recommendations
    patient = Patient.find(self.patient_id)

    recs = ""
    if self.patient.medications
      continue = self.patient.medications.select{ |m| m.current? }
      discontinue = self.patient.medications - continue
      if continue.length != 0
        recs << " \nWe advise #{self.patient.first_name} continue to take\n*  #{list_constructor(continue.map{|m| m.generate_summary}, "", ";\n* ")}."
      end
      if discontinue.length != 0
        recs << " \nWe advise him to discontinue taking #{list_constructor(discontinue.map{|m| m.generate_summary}, "or", ";\n* ")}."
      end
    end

    return %(#{recs.blank? ? "We have no recommendations for further care at this time." : recs})
  end

  def signature
    return %(I have assured #{patient.first_name} that the whole clinic team will be available to #{patient.object_pronoun} in case there are any issues that arise in the future. I encouraged #{patient.object_pronoun} to contact me if #{patient.subject_pronoun} has any problems with or is intolerant of any changes we recommended.
    \nIt has been a pleasure to participate in #{patient.first_name.capitalize}'s care. If there are any questions or concerns, please don't hesitate contact us.
    \nSincerely,
    \n#{self.clinician.first_name} #{self.clinician.last_name}
    \n#{self.clinician.practice_name})
  end

  def report
    return %(#{self.header}
    \n#{self.vitals_paragraph}
    \n#{self.meds_paragraph}
    \n#{self.imagery_paragraph}
    \n#{self.family_paragraph}
    \n#{self.concerns_body}
    \n#{self.recommendations}
    \n#{self.signature})
  end
end
