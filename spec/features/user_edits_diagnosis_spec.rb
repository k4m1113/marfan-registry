require 'rails_helper'
require 'spec_helper'

feature 'user adds diagnosis through visit', type: :feature do
  context 'with positive osteoporosis diagnosis' do
    let!(:current_visit) {
      FactoryGirl.create(:visit,
                         patient: Patient.last)
    }
    let!(:diagnosis) {
      FactoryGirl.create(:diagnosis,
                         patient: Patient.last,
                         visit: current_visit,
                         note: 'taking calcium supplements')
    }

    scenario 'from patient page', js: true do
      visit patients_path
      page.all("a[rel='next']").last.click
      click_link 'Macbeth, Lady'
      expect(page).to have_current_path patient_path(current_visit.patient.id)
      # binding.remote_pry
      expect(page).to_not have_content('No concerns noted yet')

      expect(page).to have_content('orthopedic concerns')
      page.find('a.open-tab').click
      edit_button = page.all('div.btn-group').last.find('a.btn', match: :first)
      edit_button.click
      expect(page).to have_current_path edit_diagnosis_path(diagnosis.id)
    end
  end
end
