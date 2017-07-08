Clinician.create!(
  first_name: "David",
  last_name: "Liang",
  practice_name: "The Stanford University Center for Marfan Syndrome and Aortic Disorders",
  address_line_1: "Stanford University Medical Center Cardiology Clinic, 2nd Floor of Main Hospital",
  address_line_2: "300 Pasteur Drive",
  address_line_3: "H2157",
  city: "Stanford",
  state: "CA",
  country: "USA",
  postal_code: 94305
)
Visit.create!(
  clinician_id: Clinician.first.id,
  patient_id: Patient.find(rand(Patient.count)).id
)
