require 'rails_helper'

feature 'clinician can initiate appointment' do
  let!(:liang) { FactoryGirl.create(:clinician) }

  scenario 'new appointment for existing patient' do
  end

  scenario 'new appointment for new patient' do
  end
end
