require 'rails_helper'

RSpec.describe PatientDiagnosticProcedure, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:diagnostic_procedure) { create(:diagnostic_procedure) }
    let(:patient_diagnostic_procedure) do
      build(:patient_diagnostic_procedure,
            patient: patient,
            diagnostic_procedure: diagnostic_procedure)
    end

    it 'has a valid factory' do
      expect(patient_diagnostic_procedure).to be_valid
    end

    it 'requires a patient' do
      patient_diagnostic_procedure.patient = nil
      expect(patient_diagnostic_procedure).to be_invalid
      expect(patient_diagnostic_procedure.errors['patient']).to be_present
    end

    it 'requires a diagnostic_procedure' do
      patient_diagnostic_procedure.diagnostic_procedure = nil
      expect(patient_diagnostic_procedure).to be_invalid
      expect(patient_diagnostic_procedure.errors['diagnostic_procedure']).to be_present
    end
  end
end
