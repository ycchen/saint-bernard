require 'rails_helper'

RSpec.describe PatientTreatment, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:treatment) { create(:treatment) }
    let(:patient_treatment) do
      build(:patient_treatment,
            patient: patient,
            treatment: treatment)
    end

    it 'has a valid factory' do
      expect(patient_treatment).to be_valid
    end

    it 'requires a patient' do
      patient_treatment.patient = nil
      expect(patient_treatment).to be_invalid
      expect(patient_treatment.errors['patient']).to be_present
    end

    it 'requires a diagnosis' do
      patient_treatment.treatment = nil
      expect(patient_treatment).to be_invalid
      expect(patient_treatment.errors['treatment']).to be_present
    end
  end
end
