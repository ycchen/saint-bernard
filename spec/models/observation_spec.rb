require 'rails_helper'

RSpec.describe Observation, type: :model do
  describe 'validations' do
    let(:observation) { build(:observation) }

    it 'has a valid factory' do
      expect(observation).to be_valid
    end

    it 'requires a description' do
      observation.description = nil
      expect(observation).to be_invalid
      expect(observation.errors['description']).to be_present
    end

    it 'requires a moment' do
      observation.moment = nil
      expect(observation).to be_invalid
      expect(observation.errors['moment']).to be_present
    end
  end
end
