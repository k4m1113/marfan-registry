require 'rails_helper'

feature 'clinician can initiate appointment' do
  let!(:liang) { FactoryGirl.create(:clinician) }

  scenario 'new appointment for existing patient' do
    visit root_path

    expect(page).to have_content "New or Existing Patient?"

    click_button "Existing Patient"

    expect(page).to have_content "Patient ID"

    fill_in "Patient ID", with: "1"

    click_button "New Visit"

    expect(page).to have_content "Reason for appointment"
  end

  scenario 'new appointment for new patient' do
  end
end
