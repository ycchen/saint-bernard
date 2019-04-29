require 'rails_helper'

RSpec.describe Treatment, type: :model do
  let(:treatment) { build(:treatment) }

  describe 'validations' do
    it 'has a valid factory' do
      expect(treatment).to be_valid
    end

    it 'requires a description' do
      treatment.description = nil
      expect(treatment).to be_invalid
      expect(treatment.errors['description']).to be_present
    end

    it 'requires a necessity' do
      treatment.necessity = nil
      expect(treatment).to be_invalid
      expect(treatment.errors['necessity']).to be_present
    end
  end

  describe '#to' do
    it 'returns "to"' do
      expect(treatment.to).to eq('to')
    end
  end
end
