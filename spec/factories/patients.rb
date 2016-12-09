FactoryGirl.define do
  require 'date'
  factory :patient do
    first_name "Kamille"
    last_name "Delgardo"
    date_of_birth DateTime.now
    sex "F"
    deceased false

    address_line_1 "1500 Main Street"
    address_line_2 "Apartment 4"
    city "San Francisco"
    state "CA"
    country "USA"
    postal_code 94123
  end
end
