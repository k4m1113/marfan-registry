require 'rails_helper'
require 'spec_helper'

feature 'user adds diagnosis through visit', type: :feature do
  context 'with positive osteoporosis diagnosis' do
    let!(:current_visit) {
      FactoryGirl.create(:visit,
                         patient_id: 1)
    }
    let!(:diagnosis) {
      FactoryGirl.create(:diagnosis,
                         patient_id: 1,
                         visit_id: current_visit.id)
    }

    scenario 'from patient page' do
      visit patients_path
      click_link 'Marfan, Antoine'
      expect(page).to have_current_path patient_path(current_visit.patient_id)
      expect(page).to_not have_content('No concerns noted yet
')

      page.find('div.card-header.summary-bar', match: :first).click
      save_and_open_page
      expect(page).to have_content('Diagnoses')
      edit_button = page.all('div.btn-group').last.find('a.btn', match: :first)
      edit_button.click
      expect(page).to have_current_path edit_diagnosis_path(diagnosis.id)
    end
  end
end
