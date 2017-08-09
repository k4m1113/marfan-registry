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
end
