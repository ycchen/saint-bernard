require 'rails_helper'

RSpec.describe AdmissionDiagnosis, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:admission) { create(:admission, patient: patient) }
    let(:diagnosis) { create(:diagnosis) }
    let(:admission_diagnosis) do
      build(:admission_diagnosis,
            admission: admission,
            diagnosis: diagnosis)
    end

    it 'has a valid factory' do
      expect(admission_diagnosis).to be_valid
    end

    it 'requires an admission' do
      admission_diagnosis.admission = nil
      expect(admission_diagnosis).to be_invalid
      expect(admission_diagnosis.errors['admission']).to be_present
    end

    it 'requires a diagnosis' do
      admission_diagnosis.diagnosis = nil
      expect(admission_diagnosis).to be_invalid
      expect(admission_diagnosis.errors['diagnosis']).to be_present
    end
  end
end
