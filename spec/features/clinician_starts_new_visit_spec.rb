require "rails_helper"

feature "clinician can initiate appointment" do
  let!(:liang) { FactoryGirl.create(:clinician) }
  let!(:kamille) { FactoryGirl.create(:patient) }

  before do
    visit new_visit_path

    fill_in "visit_patient_id", with: kamille.id
    fill_in "visit_clinician_id", with: liang.id

    choose("visit_general_health_good")
  end

  scenario "patient is being seen for family history" do

  end

  scenario "patient has had recent testing" do

  end
end
