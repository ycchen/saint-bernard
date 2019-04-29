require 'rails_helper'

RSpec.describe OrderFrequency, type: :model do
  let(:order_frequency) { build(:order_frequency, value: 4) }

  describe 'validations' do
    it 'has a valid factory' do
      expect(order_frequency).to be_valid
    end

    it 'requires a value' do
      order_frequency.value = nil
      expect(order_frequency).to be_invalid
      expect(order_frequency.errors['value']).to be_present
    end

    it 'requires a frequency_unit' do
      order_frequency.frequency_unit = nil
      expect(order_frequency).to be_invalid
      expect(order_frequency.errors['frequency_unit']).to be_present
    end
  end

  describe '#to_s' do
    it 'returns a string' do
      expect(order_frequency.to_s).to eq('q4hr')
    end
  end
end
