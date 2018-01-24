FactoryBot.define do
  factory :visit do
    patient
    clinician

    general_health "good"
    primary_reason "for recent testing"
  end
end
