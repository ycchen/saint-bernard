require 'rails_helper'

RSpec.describe Patient, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  let(:now) { Time.zone.local(2019, 4, 28, 1, 2, 3) }
  let(:facility) { create(:facility) }
  let(:patient) do
    build(:patient,
          facility: facility,
          first_name: 'Alfred',
          middle_name: 'Edward',
          last_name: 'Newman',
          dob: Date.new(1972, 8, 10))
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(patient).to be_valid
    end

    it 'requires a facility' do
      patient.facility = nil
      expect(patient).to be_invalid
      expect(patient.errors['facility']).to be_present
    end

    it 'requires a first_name' do
      patient.first_name = nil
      expect(patient).to be_invalid
      expect(patient.errors['first_name']).to be_present
    end

    it 'requires a middle_name' do
      patient.middle_name = nil
      expect(patient).to be_invalid
      expect(patient.errors['middle_name']).to be_present
    end

    it 'requires a last_name' do
      patient.last_name = nil
      expect(patient).to be_invalid
      expect(patient.errors['last_name']).to be_present
    end

    it 'requires a mr' do
      patient.mr = nil
      expect(patient).to be_invalid
      expect(patient.errors['mr']).to be_present
    end

    it 'requires a dob' do
      patient.dob = nil
      expect(patient).to be_invalid
      expect(patient.errors['dob']).to be_present
    end

    it 'requires a gender' do
      patient.gender = nil
      expect(patient).to be_invalid
      expect(patient.errors['gender']).to be_present
    end
  end

  describe '#name' do
    it 'returns a name' do
      expect(patient.name).to eq('Newman, Alfred E.')
    end
  end

  describe '#date_of_birth' do
    it 'returns a date' do
      expect(patient.date_of_birth).to eq('August 10, 1972')
    end
  end

  describe '#age' do
    it 'returns an age in years' do
      travel_to now do
        expect(patient.age).to eq('46')
      end
    end
  end
end
