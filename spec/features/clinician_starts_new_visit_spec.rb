require 'rails_helper'
require 'spec_helper'
require 'rspec/expectations'

feature 'clinician can initiate appointment' do
  Patient.all.each(&:destroy)
  let!(:liang) { FactoryGirl.create :clinician }
  let!(:kamille) { FactoryGirl.create :patient, primary_diagnosis: 'Malaise' }

  background do
    Patient.find(1).update(primary_diagnosis: 'Malaise')
    visit '/patients'
    save_and_open_page
    click_button 'New Visit', match: :first
  end

  scenario 'patient has primary diagnosis' do
    expect(page).to have_content 'Malaise'
  end

  scenario 'reason for visit added to visit' do
    expect(page).to have_content 'Reason for Visit:'
    binding.remote_pry
    rfvs = page.querySelectorAll('div.alert-warning').children('label')

  end
end
