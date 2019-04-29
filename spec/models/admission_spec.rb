require 'rails_helper'

RSpec.describe Admission, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  let(:now) { Time.zone.local(2019, 4, 28, 1, 2, 3) }
  let(:facility) { create(:facility) }
  let(:patient) { create(:patient, facility: facility) }
  let(:admission) { build(:admission, patient: patient) }

  describe 'validations' do
    it 'has a valid factory' do
      expect(admission).to be_valid
    end

    it 'requires a patient' do
      admission.patient = nil
      expect(admission).to be_invalid
      expect(admission.errors['patient']).to be_present
    end

    it 'requires a moment' do
      admission.moment = nil
      expect(admission).to be_invalid
      expect(admission.errors['moment']).to be_present
    end
  end

  describe '#date' do
    it 'returns a date' do
      travel_to now do
        expect(admission.date).to eq('April 28, 2019')
      end
    end
  end

  describe '#time' do
    it 'returns a date' do
      travel_to now do
        expect(admission.time).to eq('1:02 am')
      end
    end
  end
end
