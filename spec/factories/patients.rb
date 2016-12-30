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

    phone_1 "800-999-9999"
    phone_2 "800-888-8888"
    email "kamille@kamille.kamille"
  end
end
