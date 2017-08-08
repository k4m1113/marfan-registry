require 'rails_helper'
require 'spec_helper'
require 'rspec/expectations'

feature 'clinician can initiate appointment' do
  let!(:liang) { FactoryGirl.create :clinician }
  let!(:kamille) { FactoryGirl.create :patient, primary_diagnosis: 'Malaise' }

  background do
    visit '/patients'

    click_button 'New Visit', match: :first
  end

  scenario 'patient has primary diagnosis' do
    expect(page).to have_content 'Malaise'
  end

  scenario 'patient is being seen for family history' do

  end

  scenario 'patient has had recent testing' do

  end

  scenario 'patient has had related symptoms' do

  end

  scenario 'patient has been hospitalized recently' do

  end
end
