require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do
  let(:medication_order) { build(:medication_order) }

  describe 'validations' do
    it 'has a valid factory' do
      expect(medication_order).to be_valid
    end

    it 'requires a name' do
      medication_order.name = nil
      expect(medication_order).to be_invalid
      expect(medication_order.errors['name']).to be_present
    end

    it 'requires a dosage' do
      medication_order.dosage = nil
      expect(medication_order).to be_invalid
      expect(medication_order.errors['dosage']).to be_present
    end

    it 'requires a necessity' do
      medication_order.necessity = nil
      expect(medication_order).to be_invalid
      expect(medication_order.errors['necessity']).to be_present
    end

    it 'requires a route' do
      medication_order.route = nil
      expect(medication_order).to be_invalid
      expect(medication_order.errors['route']).to be_present
    end

    it 'requires a unit' do
      medication_order.unit = nil
      expect(medication_order).to be_invalid
      expect(medication_order.errors['unit']).to be_present
    end
  end

  describe '#to' do
    it 'returns "to"' do
      expect(medication_order.to).to eq('to')
    end
  end
end
