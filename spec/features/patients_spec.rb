require 'rails_helper'

RSpec.feature 'Patients', type: :feature do
  let(:facility) { create(:facility, name: 'Facility') }
  let!(:patient) do
    create(:patient,
           :with_admission,
           :with_allergies,
           :with_chronic_conditions,
           :with_medications,
           :with_diagnostic_procedures,
           :with_diagnoses,
           :with_treatments,
           facility: facility,
           first_name: 'Alfred',
           middle_name: 'Edward',
           last_name: 'Newman',
           mr: 'MR-8675309')
  end

  describe 'have an index page', js: true do
    it 'lists patients' do
      visit patients_path
      expect(page).to have_css('h3', text: 'Patients')

      click_button 'All Facilities'
      click_link 'Facility'

      expect(page).to have_css('td', text: 'Newman, Alfred E.')

      click_link 'Transfer'
      expect(page).to have_css('th', text: 'Emergency Transfer Summary (Form 34L-D)')
      expect(page).to have_css('td', text: 'MR-8675309')
    end
  end
end