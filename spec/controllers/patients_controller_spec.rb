require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let!(:facility_1) { create(:facility, name: 'Facility 1') }
  let(:facility_2) { create(:facility, name: 'Facility 2') }

  describe 'GET #index' do
    it 'returns success' do
      get :index
      expect(response).to be_successful
      expect(assigns[:facilities]).to eq([facility_1])
    end
  end

  describe 'with patients' do
    let!(:patient_1) { create(:patient, facility: facility_1, last_name: 'Brown') }
    let!(:patient_2) { create(:patient, facility: facility_2, last_name: 'Alfred') }

    describe 'GET #list' do
      it 'returns success' do
        get :list, xhr: true
        expect(response).to be_successful
        expect(assigns[:patients]).to eq([patient_2, patient_1])
      end

      it 'returns success with a facility' do
        get :list, xhr: true, params: { facility_id: facility_1.id }
        expect(response).to be_successful
        expect(assigns[:patients]).to eq([patient_1])
      end
    end

    describe 'GET #transfer' do
      let(:path) { "#{Rails.root}/templates" }
      let(:template) { 'form_34L-D.html' }
      let(:data) { { patient: patient_1, facility: facility_1 } }

      it 'returns success' do
        get :transfer, params: { id: patient_1.id }
        expect(response).to be_successful
        expect(assigns[:path]).to eq(path)
        expect(assigns[:template]).to eq(template)
        expect(assigns[:data]).to eq(data)
      end
    end
  end
end
