require 'rails_helper'

RSpec.describe Symptom, type: :model do
  describe 'validations' do
    let(:symptom) { build(:symptom) }

    it 'has a valid factory' do
      expect(symptom).to be_valid
    end

    it 'requires a description' do
      symptom.description = nil
      expect(symptom).to be_invalid
      expect(symptom.errors['description']).to be_present
    end
  end
end
