require 'rails_helper'

RSpec.describe PatientMedication, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:medication_order) { create(:medication_order) }
    let(:patient_medication) do
      build(:patient_medication,
            patient: patient,
            medication_order: medication_order)
    end

    it 'has a valid factory' do
      expect(patient_medication).to be_valid
    end

    it 'requires a patient' do
      patient_medication.patient = nil
      expect(patient_medication).to be_invalid
      expect(patient_medication.errors['patient']).to be_present
    end

    it 'requires a medication_order' do
      patient_medication.medication_order = nil
      expect(patient_medication).to be_invalid
      expect(patient_medication.errors['medication_order']).to be_present
    end
  end
end
