require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  let(:diagnosis) { build(:diagnosis, code: 'A', description: 'desc') }

  describe 'validations' do
    it 'has a valid factory' do
      expect(diagnosis).to be_valid
    end

    it 'requires a coding_system' do
      diagnosis.coding_system = nil
      expect(diagnosis).to be_invalid
      expect(diagnosis.errors['coding_system']).to be_present
    end

    it 'requires a code' do
      diagnosis.code = nil
      expect(diagnosis).to be_invalid
      expect(diagnosis.errors['code']).to be_present
    end

    it 'requires a description' do
      diagnosis.description = nil
      expect(diagnosis).to be_invalid
      expect(diagnosis.errors['description']).to be_present
    end
  end

  describe '#described_code' do
    it 'returns a described code' do
      expect(diagnosis.described_code).to eq('desc (A)')
    end
  end
end
