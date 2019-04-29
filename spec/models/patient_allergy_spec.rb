require 'rails_helper'

RSpec.describe PatientAllergy, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:allergy) { create(:allergy) }
    let(:patient_allergy) do
      build(:patient_allergy,
            patient: patient,
            allergy: allergy)
    end

    it 'has a valid factory' do
      expect(patient_allergy).to be_valid
    end

    it 'requires a patient' do
      patient_allergy.patient = nil
      expect(patient_allergy).to be_invalid
      expect(patient_allergy.errors['patient']).to be_present
    end

    it 'requires a diagnosis' do
      patient_allergy.allergy = nil
      expect(patient_allergy).to be_invalid
      expect(patient_allergy.errors['allergy']).to be_present
    end
  end
end
