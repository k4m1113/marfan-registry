require 'rails_helper'

feature 'user edits diagnosis', type: :feature do
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

    scenario 'from patient page', js: true do
      visit patients_path
      page.all("a[rel='next']").last.click
      click_link 'Oyl, Olive'
      expect(page).to have_current_path patient_path(current_visit.patient.id)
      expect(page).to_not have_content('No concerns noted yet')

      expect(page).to have_content('orthopedic concerns')
      page.find('a.open-tab').click
      edit_button = page.all('div.btn-group').last.find('a.btn', match: :first)
      edit_button.click
      expect(page).to have_current_path edit_diagnosis_path(diagnosis.id)
      expect(page).to have_content diagnosis.generate_full_summary

      fill_in 'diagnosis_frequency', with: '2 times per decade'
      page.find("button[type='submit']").click
      expect(page).to have_current_path patient_path(patient.id)

      alert = page.find('div.alert')
      expect(alert).to have_content "#{diagnosis.generate_summary} updated for patient Oyl, Olive"
    end

    scenario 'from visit page', js: true do
      visit visits_path

      click_button 'Edit Visit', match: :first
      expect(page).to have_current_path edit_visit_path(current_visit.id)

      expect(page).to have_content('orthopedic concerns')
      summary_bar = page.find('div.card.summary-bar')
      summary_bar.click
      expect(page).to have_content diagnosis.note
      edit_button = summary_bar.all('div.btn-group').last.find('a.btn', match: :first)
      edit_button.click
      expect(page).to have_current_path edit_diagnosis_path(diagnosis.id)
      expect(page).to have_content diagnosis.generate_full_summary

      fill_in 'diagnosis_frequency', with: '8 times per lifetime'
      page.find("button[type='submit']").click
      expect(page).to have_current_path edit_visit_path(current_visit.id)

      alert = page.find('div.alert')
      expect(alert).to have_content "#{diagnosis.generate_summary} updated for patient Oyl, Olive"

      summary_bar.click
      expect(page).to have_content '8 times per lifetime'
    end
  end
end
