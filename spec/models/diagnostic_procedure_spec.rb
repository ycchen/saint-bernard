require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do
  let(:diagnostic_procedure) { build(:diagnostic_procedure) }

  describe 'validations' do
    it 'has a valid factory' do
      expect(diagnostic_procedure).to be_valid
    end

    it 'requires a description' do
      diagnostic_procedure.description = nil
      expect(diagnostic_procedure).to be_invalid
      expect(diagnostic_procedure.errors['description']).to be_present
    end

    it 'requires a moment' do
      diagnostic_procedure.moment = nil
      expect(diagnostic_procedure).to be_invalid
      expect(diagnostic_procedure.errors['moment']).to be_present
    end
  end

  describe '#on' do
    it 'returns "on"' do
      expect(diagnostic_procedure.on).to eq('on')
    end
  end

  describe '#at' do
    it 'returns "at"' do
      expect(diagnostic_procedure.at).to eq('at')
    end
  end
end
