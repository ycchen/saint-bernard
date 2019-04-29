require 'rails_helper'

RSpec.describe AdmissionObservation, type: :model do
  describe 'validations' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:admission) { create(:admission, patient: patient) }
    let(:observation) { create(:observation) }
    let(:admission_observation) do
      build(:admission_observation,
            admission: admission,
            observation: observation)
    end

    it 'has a valid factory' do
      expect(admission_observation).to be_valid
    end

    it 'requires an admission' do
      admission_observation.admission = nil
      expect(admission_observation).to be_invalid
      expect(admission_observation.errors['admission']).to be_present
    end

    it 'requires a observation' do
      admission_observation.observation = nil
      expect(admission_observation).to be_invalid
      expect(admission_observation.errors['observation']).to be_present
    end
  end
end
