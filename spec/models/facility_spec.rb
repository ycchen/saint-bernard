require 'rails_helper'

RSpec.describe Facility, type: :model do
  describe 'validations' do
    let(:facility) { build(:facility) }

    it 'has a valid factory' do
      expect(facility).to be_valid
    end

    it 'requires a name' do
      facility.name = nil
      expect(facility).to be_invalid
      expect(facility.errors['name']).to be_present
    end
  end
end
