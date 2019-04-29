require 'rails_helper'

RSpec.describe Allergy, type: :model do
  describe 'validations' do
    let(:allergy) { build(:allergy) }

    it 'has a valid factory' do
      expect(allergy).to be_valid
    end

    it 'requires a description' do
      allergy.description = nil
      expect(allergy).to be_invalid
      expect(allergy.errors['description']).to be_present
    end
  end
end
