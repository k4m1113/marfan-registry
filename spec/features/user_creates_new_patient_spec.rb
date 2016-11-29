require 'rails_helper'
require 'spec_helper'

feature 'user can add new patient' do

  background do
    visit new_patient_path
  end

  scenario "user adds new patient with valid information" do
    expect(page).to have_content("New Patient Information")

    fill_in "patient_first_name", with: "Abraham"
    fill_in "patient_last_name", with: "Lincoln"
    fill_in "patient_date_of_birth", with: "02/12/1809"
    choose "patient_sex_m"
    fill_in "patient_address_line_1", with: "1600 Pennsylvania Avenue NW"
    fill_in "patient_city", with: "Washington"
    fill_in "patient_state", with: "DC"
    fill_in "patient_postal_code", with: "20500"
    fill_in "patient_country", with: "USA"

    click_button "Add New Patient"

    expect(page).to have_content("Patient Lincoln, Abraham successfully added!")
    expect(page).to have_content("All Patients")
  end

  scenario "user adds new patient with invalid information" do
    expect(page).to have_content("New Patient Information")

    fill_in "patient_first_name", with: "Abraham"
    fill_in "patient_last_name", with: "Lincoln"
    fill_in "patient_date_of_birth", with: "02/12/1809"
    choose "patient_sex_m"

    click_button "Add New Patient"

    expect(page).to have_content("Please re-check information and/or fill required fields.")
    expect(page).to have_content("New Patient Information")
  end
  
end
