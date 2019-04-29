require 'rails_helper'

RSpec.describe TemplateParser, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  let(:data) { { foo: 'bar' } }
  let(:template) { 'template.html' }
  let(:path) { "#{Rails.root}/spec/fixtures" }
  let(:parser) { TemplateParser.new(path, template, data) }

  describe '#new' do
    it 'assigns the template' do
      expect(parser.template).to eq(template)
    end

    it 'creates a binding' do
      expect(parser.binding.class).to eq(Binding)
    end
  end

  describe '#template_html' do
    let(:file) { "#{path}/#{template}" }
    let(:html) { '<td>content</td>' }

    it 'returns template contents' do
      allow(File).to receive(:read).with(file) { html }
      expect(parser.template_html(path, template)).to eq(html)
    end
  end

  describe '#matches' do
    let(:html) { '{{foo}} and {{bars > baz}}' }

    it 'returns strings to evaluate' do
      expected = ['foo', 'bars > baz']
      expect(parser.matches(html)).to eq(expected)
    end
  end

  describe '#date_or_time_call' do
    it 'returns a date format' do
      expected = 'strftime("%B %e, %Y")'
      expect(parser.date_or_time_call('date')).to eq(expected)
    end

    it 'returns a time format' do
      expected = 'strftime("%l:%M %P").strip'
      expect(parser.date_or_time_call('time')).to eq(expected)
    end

    it 'raises a not implemented error' do
      expect {
        parser.date_or_time_call('foo')
      }.to raise_error('Not implemented: foo')
    end
  end

  describe '#item_send' do
    it 'creates a send for description' do
      expected = "\#{item.send(:description)}"
      expect(parser.item_send('description')).to eq(expected)
    end

    it 'creates a send for "on"' do
      expected = "\#{item.send(:\"on\")}"
      expect(parser.item_send('"on"')).to eq(expected)
    end

    it 'creates a send for moment.date' do
      expected = "\#{item.send(:moment).strftime(\"%B %e, %Y\")}"
      expect(parser.item_send('moment.date')).to eq(expected)
    end
  end

  describe '#items_to_send' do
    let(:elements) { 'description, "on", moment.date' }

    it 'returns an array of items to send' do
      expected = "\#{item.send(:description)} \#{item.send(:\"on\")} \#{item.send(:moment).strftime(\"%B %e, %Y\")}"
      expect(parser.items_to_send(elements)).to eq(expected)
    end
  end

  describe '#collected_items' do
    let(:str) { 'patient.diagnostic_procedures > description, "on", moment.date' }

    it 'returns collected items' do
      expected = "patient.diagnostic_procedures.collect { |item| \"\#{item.send(:description)} \#{item.send(:\"on\")} \#{item.send(:moment).strftime(\"%B %e, %Y\")}\" }"
      expect(parser.collected_items(str)).to eq(expected)
    end
  end

  describe '#piped_eval' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility) }
    let(:treatment) do
      create(:treatment,
             description: 'description',
             necessity: 'necessity')
      end
    let!(:patient_treatment) do
      create(:patient_treatment,
             patient: patient,
             treatment: treatment)
    end
    let(:data) { { patient: patient } }
    let(:str) { 'patient.treatments > description, "to", necessity | space_join | to_sentence' }

    it 'evaluates piped elements' do
      expected = 'description to necessity'
      expect(parser.piped_eval(str)).to eq(expected)
    end
  end

  describe '#evaluate_match' do
    let(:facility) { create(:facility) }
    let(:patient) { create(:patient, facility: facility, first_name: 'Alfred') }
    let(:allergy) { create(:allergy, description: 'description') }
    let!(:patient_allergy) do
      create(:patient_allergy,
             patient: patient,
             allergy: allergy)
    end
    let(:data) { { patient: patient } }

    it 'evaluates a piped match' do
      str = 'patient.allergies > description | to_sentence'
      expect(parser.evaluate_match(str)).to eq('description')
    end

    it 'evaluates a non-piped match' do
      str = 'patient.first_name'
      expect(parser.evaluate_match(str)).to eq('Alfred')
    end
  end

  describe '#to_s' do
    let(:now) { DateTime.new(2019, 4, 28, 12, 34, 56, -5) }
    let(:facility) { create(:facility, name: 'Name') }
    let(:patient) do
      create(:patient,
             facility: facility,
             first_name: 'First',
             middle_name: 'Middle',
             last_name: 'Last',
             dob: now - 46.years,
             mr: 'MR-8675309',
             gender: :male)
    end

    let(:diagnosis) do
      create(:diagnosis,
             code: 'code',
             description: 'description')
    end

    let(:symptom) { create :symptom, description: 'description' }
    let(:observation) do
      create(:observation, description: 'description', moment: now)
    end

    let!(:admission) do
      create(:admission,
             diagnoses: [diagnosis],
             symptoms: [symptom],
             observations: [observation],
             moment: now,
             patient: patient)
    end

    let(:treatment) do
      create(:treatment,
             description: 'description',
             necessity: 'necessity')
    end
    let!(:patient_treatment) do
      create(:patient_treatment,
             patient: patient,
             treatment: treatment)
    end

    let!(:patient_diagnosis) do
      create(:patient_diagnosis, patient: patient, diagnosis: diagnosis)
    end

    let(:diagnostic_procedure) do
      create(:diagnostic_procedure,
             description: 'description',
             moment: now)
    end
    let!(:patient_diagnostic_procedure) do
      create(:patient_diagnostic_procedure,
             patient: patient,
             diagnostic_procedure: diagnostic_procedure)
    end

    let(:allergy) { create(:allergy, description: 'description') }
    let!(:patient_allergy) do
      create :patient_allergy, patient: patient, allergy: allergy
    end

    let!(:chronic_condition) do
      create(:chronic_condition,
             patient: patient,
             diagnosis: diagnosis)
    end

    let(:order_frequency) { create(:order_frequency, value: '2') }
    let(:medication_order) do
      create(:medication_order,
             name: 'name',
             dosage: 6,
             route: :PO,
             necessity: 'necessity',
             frequency: order_frequency)
    end
    let!(:patient_medication) do
      create(:patient_medication,
             patient: patient,
             medication_order: medication_order)
    end

    let(:data) { { patient: patient, facility: facility } }

    it 'returns a parsed template' do
      travel_to now do
        result = parser.to_s
        expect(result).to include('Name')
        expect(result).to include('First')
        expect(result).to include('Middle')
        expect(result).to include('Last')
        expect(result).to include('MR-8675309')
        expect(result).to include('This 46 years old male was admitted to Name on April 28, 2019 at 12:34 pm due to description (code).')
        expect(result).to include('The observed symptoms on admission were description.')
        expect(result).to include('Upon asking about known allergies, the patient disclosed description.')
        expect(result).to include('Upon asking about chronic conditions, the patient disclosed description (code).')
        expect(result).to include('The patient was administered with name 6.0 PO q2hr to necessity.')
        expect(result).to include('The staff performed description on April 28, 2019 at 12:34 pm, revealing description (code).')
        expect(result).to include('Our team proceeded to description to necessity.')
      end
    end
  end
end
