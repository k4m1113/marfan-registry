require "spec_helper"
require "rails_helper"

feature "patient search returns list of patients" do
  let!(:john) { FactoryGirl.create(:patient, first_name: "John", last_name: "Doe") }
  let!(:jane) { FactoryGirl.create(:patient, first_name: "Jane", last_name: "Doe") }
  let!(:freddie) { FactoryGirl.create(:patient, first_name: "Freddy", last_name: "Mercury") }

  background do
    visit patients_path
  end

  scenario "user does not query search" do
    expect(page).to have_content("All Patients")
    expect(page).to have_content(john.first_name)
    expect(page).to have_content(jane.first_name)
    expect(page).to have_content(freddie.first_name)

    expect(page).to_not have_content("Liang")
  end

  scenario "user enters search query" do
    fill_in "search", with: john.last_name

    click_button "search"

    expect(page).to have_content("All patients whose names include")

    expect(page).to have_content(john.first_name)
    expect(page).to have_content(jane.first_name)

    expect(page).to_not have_content(freddie.first_name)
  end

end
