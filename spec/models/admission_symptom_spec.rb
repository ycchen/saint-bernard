require 'rails_helper'

RSpec.describe AdmissionSymptom, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:admission) { create(:admission, patient: patient) }
    let(:symptom) { create(:symptom) }
    let(:admission_symptom) do
      build(:admission_symptom,
            admission: admission,
            symptom: symptom)
    end

    it 'has a valid factory' do
      expect(admission_symptom).to be_valid
    end

    it 'requires an admission' do
      admission_symptom.admission = nil
      expect(admission_symptom).to be_invalid
      expect(admission_symptom.errors['admission']).to be_present
    end

    it 'requires a symptom' do
      admission_symptom.symptom = nil
      expect(admission_symptom).to be_invalid
      expect(admission_symptom.errors['symptom']).to be_present
    end
  end
end
