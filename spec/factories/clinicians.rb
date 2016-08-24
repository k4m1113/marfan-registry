FactoryGirl.define do
  factory :clinician do
    first_name "David"
    last_name "Liang"
    practice_name "The Center for Marfan Syndrome and Related Aortic Disorders at Stanford University Hospital"

    address_line_1 "300 Pasteur Drive"
    address_line_2 "3rd Floor, Room A31"
    city "Stanford"
    state "CA"
    country "USA"
    postal_code 94305
  end
end
