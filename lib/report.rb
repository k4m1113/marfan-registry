module Report

  attr_reader :report

  def patient
    Patient.find(patient_id)
  end

  def header
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
    vitals = self.vitals
    phrases = []

    phrases << "a blood pressure of #{vitals.select { |v| v.topic.name == 'SBP' }[0].measurement}/#{vitals.select { |v| v.topic.name == 'DBP' }[0].measurement}" if vitals.select { |v| v.topic.name == 'SBP' }[0]
    phrases << "a pulse of #{vitals.select { |v| v.topic.name == 'heart rate' }[0].measurement}" if vitals.select { |v| v.topic.name == 'heart rate' }[0]
    phrases << "a height of #{vitals.select { |v| v.topic.name == 'height' }[0].measurement.to_f.round(2)}m" if vitals.select { |v| v.topic.name == 'height' }[0]
    phrases << "a weight of #{vitals.select { |v| v.topic.name == 'weight' }[0].measurement.to_f.round(2)}kg" if vitals.select { |v| v.topic.name == 'weight' }[0]
    phrases << "a temperature of #{vitals.select { |v| v.topic.name == 'temperature' }[0].measurement.to_f.round(1)}°C" if vitals.select { |v| v.topic.name == 'temperature' }[0]

    if phrases.empty?
      summ = %(#{patient.first_name} had no vitals measured during this visit.)
    else
      summ = %(#{patient.first_name} was in good health when I saw #{patient.object_pronoun} with #{list_constructor(phrases)}.)
    end
    summ
  end

  def family_paragraph
    patient = Patient.find(patient_id)
    family_members = patient.family_members

    if family_members.blank?
      %(A family history was not completed for #{patient.first_name} during #{patient.possessive_pronoun} visit.)
    else
      bios = ""
      family_members.each do |fm|
        bios += "\n#{fm.generate_full_summary} "
      end
      %(As part of #{patient.first_name}'s comprehensive visit we gathered the following family history: #{bios})
    end
  end

  def meds_paragraph
    patient = Patient.find(patient_id)
    meds = patient.medications.select(&:current?)
    discont = patient.medications.select { |m| m.current === false }

    if meds.blank?
      %(I did not discuss any medications with #{patient.first_name} during our visit.)
    else
      all_meds = meds.map(&:generate_full_summary)
      summ = %(#{patient.first_name.capitalize}'s medications consist of:\n•  #{list_constructor(all_meds, '', "\n• ")})
    end
    # unless discont.blank?
    #   discontinued_meds = discont.map(&:generate_full_summary)
    #   summ << %(\n\nWe discontinued:\n•  #{list_constructor(discontinued_meds, '', "\n•  ")}.)
    # end
    summ
  end

  def imagery_paragraph
    visit = self
    if !visit.heart_measurements.empty?
      paragraph = 'The following heart imagery was gathered as part of our visit: '
      results = list_constructor(visit.heart_measurements.map(&:generate_summary)) + "."
      paragraph += results
      paragraph
    else
      "No heart measurements were taken of #{patient.first_name} as part of our visit."
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
        body << "\n#{patient.first_name} had #{instances.length} #{topic}: #{list_constructor(instances.map(&:generate_full_summary))}."
      end
    end
    "#{body}
    \n#{patient.first_name} reported no #{list_constructor(no_instances, 'nor')}."
  end

  def recommendations
    patient = Patient.find(patient_id)
    recs = ''
    if patient.medications
      continue = patient.medications.select(&:current?)
      discontinue = patient.medications.select { |m| m.current === false }
      unless continue.empty?
        summ = list_constructor(continue.map(&:generate_full_summary), '', ";\n• ")
        recs << "We advise #{patient.first_name} continue to take:\n•  #{summ};"
      end
      unless discontinue.empty?
        summ = list_constructor(discontinue.map(&:generate_summary), '', ";\n• ")
        recs << "\nWe advise him to discontinue taking:\n•  #{summ};"
      end
    end
    if genetic_tests
      genetic_tests.each do |test|
        if test.predictive_testing_recommended === true
          recs << %(\n\nBased on #{patient.possessive_pronoun} genetic test results for #{test.topic.name} and the risk factors we discussed, we recommend that #{patient.first_name} undergo predictive genetic testing.)
        end
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
