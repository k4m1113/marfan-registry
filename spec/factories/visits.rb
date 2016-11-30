FactoryGirl.define do
  factory :visit do
    patient_id 1
    clinician_id 1

    height 182.00
    weight 57.09
    arm_span 183.02
    upper_segment 92.01
    lower_segment 90.01
    z_score 5.74
    general_health "good"
    primary_reason "for recent testing"
  
    patient
    clinician
  end
end
