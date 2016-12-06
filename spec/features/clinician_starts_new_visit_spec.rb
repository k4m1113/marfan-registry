require "rails_helper"
require "spec_helper"
require "rspec/expectations"

feature "clinician can initiate appointment" do
  let!(:liang) { FactoryGirl.create(:clinician) }
  let!(:kamille) { FactoryGirl.create(:patient) }

  background do
    visit new_visit_path

    fill_in "visit_patient_id", with: kamille.id
    fill_in "visit_clinician_id", with: liang.id

    page.find("#visit_general_health_good").trigger("click")
  end

  # scenario "patient is being seen for family history including deceased family member", :js => true do
  #   page.find("#visit_primary_reason_due_to_family_history").trigger("click")
  #
  #   expect(page).to have_content("Relationship:")
  #   expect(page).to have_content("Name:")
  #   expect(page).to have_content("Age:")
  #
  #   check "visit_family_members_attributes_0_living"
  #
  #   expect(page).to have_content("What was their cause of death?")
  # end
  #
  # scenario "patient is being seen for family history", :js => true do
  #   page.find("#visit_primary_reason_due_to_family_history").trigger("click")
  #
  #   expect(page).to have_content("Relationship:")
  #   expect(page).to have_content("Name:")
  #   expect(page).to have_content("Age:")
  #
  #   expect(page).to_not have_content("What was their cause of death?")
  #   expect(page).to_not have_content("What type of test was it?")
  # end

  scenario "patient has had recent testing", :js => true do
    page.find("#visit_primary_reason_for_recent_testing").trigger("click")

    expect(page).to have_content("What type of test was it?")
    expect(page).to have_content("And when was the test?")

    expect(page).to_not have_content("In which category are your symptoms?")
    expect(page).to_not have_content("Relationship:")
    expect(page).to_not have_content("What type of hospitalization was it?")

  end

  scenario "patient has had related symptoms", :js => true do
    page.find("#visit_primary_reason_because_of_related_symptoms").trigger("click")

    expect(page).to have_content("In which category are your symptoms?")

    expect(page).to_not have_content("And when was the test?")
    expect(page).to_not have_content("Relationship:")
    expect(page).to_not have_content("What type of hospitalization was it?")

  end

  scenario "patient has been hospitalized recently", :js => true do
    page.find("#visit_primary_reason_because_of_a_hospitalization").trigger("click")

    expect(page).to have_content("For how many days?")
    expect(page).to have_content("And when were you admitted?")

    expect(page).to_not have_content("In which category are your symptoms?")
    expect(page).to_not have_content("Relationship:")
    expect(page).to_not have_content("What type of test was it?")
  end
end
