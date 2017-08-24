require 'rails_helper'

feature 'user deletes diagnosis', type: :feature do
  context 'positive for osteoporosis' do
    let!(:patient) {
      FactoryGirl.create(:patient,
                         first_name: 'Olive',
                         last_name: 'Oyl')
    }
    let!(:current_visit) {
      FactoryGirl.create(:visit,
                         patient: patient)
    }
    let!(:diagnosis) {
      FactoryGirl.create(:diagnosis,
                         patient: patient,
                         visit: current_visit,
                         note: 'taking calcium supplements')
    }
    let!(:alert_text) {
      "Are you sure you want to delete diagnosis #{diagnosis.id} for #{diagnosis.topic.name} from record of #{patient.full_name}?"
    }

    scenario 'from patient page', js: true do
      visit patients_path
      page.all("a[rel='next']").last.click
      click_link 'Oyl, Olive'
      expect(page).to have_current_path patient_path(current_visit.patient.id)
      expect(page).to_not have_content('No concerns noted yet')

      expect(page).to have_content('orthopedic concerns')
      page.find('a.open-tab').click
      delete_button = page.all('div.btn-group').last.all('a.btn').last
      expect(delete_button['innerHTML']).to include 'fa fa-trash'

      accept_confirm { delete_button.click }
      expect(page).to have_current_path patient_path(patient.id)
      expect(page).to have_content "Diagnosis #{diagnosis.id} for #{diagnosis.topic.name} deleted from record"
      expect(page).to_not have_content 'orthopedic concerns'
      expect(page).to have_content 'No concerns noted yet'
    end

    scenario 'from visit page', js: true do
      visit visits_path

      click_button 'Edit Visit', match: :first
      expect(page).to have_current_path edit_visit_path(current_visit.id)

      expect(page).to have_content('orthopedic concerns')
      summary_bar = page.find('div.card.summary-bar')
      summary_bar.click
      expect(page).to have_content diagnosis.note
      delete_button = summary_bar.all('div.btn-group').last.all('a.btn').last
      delete_button.click

      accept_confirm { delete_button.click }
      expect(page).to have_current_path edit_visit_path(current_visit.id)
      expect(page).to have_content "Diagnosis #{diagnosis.id} for #{diagnosis.topic.name} deleted from record"
      expect(page).to_not have_content 'orthopedic concerns'
    end
  end
end
