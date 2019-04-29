require 'rails_helper'

RSpec.describe ChronicCondition, type: :model do
  let(:facility) { create(:facility) }
  let(:patient) { create(:patient, facility: facility) }
  let(:diagnosis) { create(:diagnosis, code: 'A', description: 'desc') }
  let(:chronic_condition) do
    build(:chronic_condition,
          patient: patient,
          diagnosis: diagnosis)
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(chronic_condition).to be_valid
    end

    it 'requires a patient' do
      chronic_condition.patient = nil
      expect(chronic_condition).to be_invalid
      expect(chronic_condition.errors['patient']).to be_present
    end

    it 'requires a diagnosis' do
      chronic_condition.diagnosis = nil
      expect(chronic_condition).to be_invalid
      expect(chronic_condition.errors['diagnosis']).to be_present
    end
  end

  describe '#described_code' do
    it 'returns a described code' do
      expect(chronic_condition.described_code).to eq('desc (A)')
    end
  end
end
