require 'rails_helper'
require 'spec_helper'

feature 'user can add new patient' do

  background do
    visit new_patient_path
  end

  scenario "user adds new patient with valid information" do
    # expect(page).to have_content("Patient Information")
    #
    # fill_in "patient_first_name", with: "Abraham"
    # fill_in "patient_middle_name", with: "Superfly"
    # fill_in "patient_last_name", with: "Lincoln"
    # fill_in "patient_date_of_birth", with: "02/12/1809"
    # choose "patient_sex_m"
    # fill_in "patient_address_line_1", with: "1600 Pennsylvania Avenue NW"
    # fill_in "patient_city", with: "Washington"
    # fill_in "patient_state", with: "DC"
    # fill_in "patient_postal_code", with: "20500"
    # fill_in "patient_country", with: "USA"
    # fill_in "patient_email", with: "a.lincoln@gmail.com"
    # fill_in "patient_phone_1", with: "1-800-777-7777"
    # fill_in "patient_phone_2", with: "900 888 8888"
    #
    # click_button "Create Patient"
    #
    # expect(page).to have_content("Patient Lincoln, Abraham successfully added!")
    # expect(page).to have_content("All Patients")
  end

  scenario "user adds new patient with invalid information" do
    # expect(page).to have_content("Patient Information")
    #
    # fill_in "patient_first_name", with: "Abraham"
    # fill_in "patient_last_name", with: "Lincoln"
    # fill_in "patient_date_of_birth", with: "02/12/1809"
    #
    # click_button "Create Patient"
    #
    # expect(page).to have_content("Address line 1 can't be blank")
    # expect(page).to have_content("Patient Information")
  end

end
