require 'rails_helper'

feature 'clinician can add new patient' do
  let!(:liang) { FactoryGirl.create(:clinician) }

  scenario 'patient has not been diagnosed with a connective tissue disorder' do
  end

  scenario 'patient has a prior diagnosis' do
  end

  scenario 'patient is a spontaneous mutation (no family history)' do
  end

  scenario 'patient has symptoms in family history' do
  end
end
