require 'rails_helper'
require 'spec_helper'
require 'rspec/expectations'

feature 'clinician can initiate appointment' do
  let!(:liang) { FactoryGirl.create :clinician }
  let!(:kamille) { FactoryGirl.create :patient, primary_diagnosis: 'Malaise' }

  background do
    Patient.find(1).update(primary_diagnosis: 'Malaise')
    visit '/patients'
    click_button 'New Visit', match: :first
  end

  scenario 'patient has primary diagnosis' do
    expect(page).to have_content 'Malaise'
  end

  scenario 'reason for visit added to visit', js: true, type: :feature do
    expect(page).to have_content 'Reason for Visit: '
    page.find('#label_primary_reason_chest_pain').click()

    page.find('button#floppy').click()

    expect(page).to have_content 'for chest pain'

    expect(page).to_not have_content 'Reason for Visit: '
  end
end
