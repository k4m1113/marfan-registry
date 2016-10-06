require 'rails_helper'

feature 'clinician can initiate appointment' do
  let!(:liang) { FactoryGirl.create(:clinician) }
  let!(:kamille) { FactoryGirl.create(:patient) }

  scenario 'new appointment for existing patient' do
    visit "/visits/new"
    fill_in "Patient ID" with: kamille.id
    fill_in "Clinician ID" with: liang.id
    choose "Fair"

    click_button "Create Visit"

    expect(page).to have_content("All Visits")
  end

  scenario 'new appointment needs both clinician and patient info' do
    visit "/visits/new"
    fill_in "Patient ID" with: kamille.id

    click_button "Create Visit"

    expect(page).to_not have_content("All Visits")
  end
end
