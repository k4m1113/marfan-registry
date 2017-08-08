require 'date'

FactoryGirl.define do
  factory :patient do
    first_name 'Antoine'
    last_name 'Marfan'
    date_of_birth 50.year.ago
    sex 'M'
    deceased false
    primary_diagnosis 'Loeys-Dietz Syndrome'

    address_line_1 '1500 Main Street'
    address_line_2 'Apartment 4'
    city 'San Francisco'
    state 'CA'
    country 'USA'
    postal_code 94123

    phone_1 '800-999-9999'
    phone_2 '800-888-8888'
    email 'antoine@marfan.org'
  end
end
