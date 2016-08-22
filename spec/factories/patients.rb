FactoryGirl.define do
  factory :patient do
    first_name "Kamille"
    last_name "Delgardo"
    day_of_birth 01
    month_of_birth 02
    year_of_birth 1903

    clinician
  end
end
