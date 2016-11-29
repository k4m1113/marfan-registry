require "rails_helper"
require "spec_helper"

feature "clinician can initiate appointment" do
  let!(:liang) { FactoryGirl.create(:clinician) }
  let!(:kamille) { FactoryGirl.create(:patient) }

  background do
    visit new_visit_path

    fill_in "visit_patient_id", with: kamille.id
    fill_in "visit_clinician_id", with: liang.id

    choose "visit_general_health_good"
  end

  scenario "patient is being seen for family history including deceased family member" do
    choose "visit_primary_reason_due_to_family_history"

    expect(page).to have_content("Relationship:")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Age:")

    check "visit_family_members_attributes_0_living"

    expect(page).to have_content("What was their cause of death?")
  end

  scenario "patient is being seen for family history" do
    choose "visit_primary_reason_due_to_family_history"

    expect(page).to have_content("Relationship:")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Age:")

    expect(page).to_not have_content("What was their cause of death?")
    expect(page).to_not have_content("What type of test was it?")
  end

  scenario "patient has had recent testing" do
    choose "visit_primary_reason_for_recent_testing"

    expect(page).to have_content("What type of test was it?")
    expect(page).to have_content("And when was the test?")

    expect(page).to_not have_content("In which category are your symptoms?")
    expect(page).to_not have_content("Relationship:")
    expect(page).to_not have_content("What type of hospitalization was it?")

  end
end
