# params for visits_controller nested attributes
module NestedParams
  attr_reader :diagnoses_attributes, :dissections_attributes, :family_members_attributes, :genetic_tests_attributes, :heart_measurements_attributes, :hospitalizations_attributes, :medications_attributes, :patient_attributes, :procedures_attributes, :tests_attributes, :vitals_attributes

  def nested_params
    def diagnoses_attributes
      Diagnosis.attributes
    end

    def dissections_attributes
      Dissection.attributes
    end

    def family_members_attributes
      FamilyMember.attributes
    end

    def genetic_tests_attributes
      GeneticTest.attributes
    end

    def heart_measurements_attributes
      HeartMeasurement.attributes
    end

    def hospitalizations_attributes
      Hospitalization.attributes
    end

    def medications_attributes
      Medication.attributes
    end

    def patient_attributes
      %i[id primary_diagnosis]
    end

    def procedures_attributes
      Procedure.attributes
    end

    def tests_attributes
      Test.attributes
    end

    def vitals_attributes
      Vital.attributes
    end
  end
end
