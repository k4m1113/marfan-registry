require 'rails_helper'


feature 'user can add new clinician' do

  background do
    visit new_clinician_path
  end

  scenario "user adds new clinician with valid information" do
    expect(page).to have_content("New Clinician Information")

    fill_in "clinician_first_name", with: "David"
    fill_in "clinician_last_name", with: "Liang"
    fill_in "clinician_practice_name", with: "The Stanford University Center for Marfan Syndrome and Aortic Disorders"
    fill_in "clinician_address_line_1", with: "Stanford University Medical Center Cardiology Clinic, 2nd Floor of Main Hospital"
    fill_in "clinician_address_line_2", with: "300 Pasteur Drive"
    fill_in "clinician_address_line_3", with: "Room H2157"

    fill_in "clinician_city", with: "Stanford"
    fill_in "clinician_state", with: "CA"
    fill_in "clinician_postal_code", with: "94305"
    fill_in "clinician_country", with: "United States"

    click_button "Add New Clinician"

    expect(page).to have_content("Clinician Liang, David successfully added!")
    expect(page).to have_content("All Clinicians")
  end

  scenario "user adds new clinician with invalid information" do
    expect(page).to have_content("New Clinician Information")

    fill_in "clinician_first_name", with: "Abraham"
    fill_in "clinician_last_name", with: "Lincoln"

    click_button "Add New Clinician"

    expect(page).to have_content("Please re-check information and/or fill required fields.")
    expect(page).to have_content("New Clinician Information")
  end

end
