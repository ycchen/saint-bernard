require 'rails_helper'

RSpec.describe PatientDiagnosis, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:diagnosis) { create(:diagnosis) }
    let(:patient_diagnosis) do
      build(:patient_diagnosis,
            patient: patient,
            diagnosis: diagnosis)
    end

    it 'has a valid factory' do
      expect(patient_diagnosis).to be_valid
    end

    it 'requires a patient' do
      patient_diagnosis.patient = nil
      expect(patient_diagnosis).to be_invalid
      expect(patient_diagnosis.errors['patient']).to be_present
    end

    it 'requires a diagnosis' do
      patient_diagnosis.diagnosis = nil
      expect(patient_diagnosis).to be_invalid
      expect(patient_diagnosis.errors['diagnosis']).to be_present
    end
  end
end
