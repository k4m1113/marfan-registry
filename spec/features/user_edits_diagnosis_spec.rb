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
      expect(page).to_not have_content('No concerns noted yet
')

      page.find('div.card-header.summary-bar').click
    end
  end
end
