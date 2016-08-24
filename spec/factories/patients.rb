FactoryGirl.define do
  factory :patient do
    first_name "Kamille"
    last_name "Delgardo"
    day_of_birth 01
    month_of_birth 02
    year_of_birth 1903
    sex "F"

    address_line_1 "1500 Main Street"
    address_line_2 "Apartment 4"
    city "San Francisco"
    state "CA"
    country "USA"
    postal_code 94123
  end
end
