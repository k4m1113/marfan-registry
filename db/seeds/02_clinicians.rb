Clinician.create!(
  first_name: 'David',
  last_name: 'Liang',
  practice_name: 'The Stanford University Center for Marfan Syndrome and Aortic Disorders',
  address_line_1: 'Stanford University Medical Center Cardiology Clinic, 2nd Floor of Main Hospital',
  address_line_2: '300 Pasteur Drive',
  address_line_3: 'H2157',
  city: 'Stanford',
  state: 'CA',
  country: 'USA',
  postal_code: 94305
)
# lucky_victim = Patient.find(rand(Patient.count))
# lucky_victim.update(
#   primary_diagnosis: 'Marfan Syndrome'
# )
# Visit.create!(
#   clinician_id: Clinician.first.id,
#   patient_id: lucky_victim.id,
#   primary_reason: 'checkup'
# )

puts "#{Clinician.count} clinicians seeded."
