require 'rails_helper'

RSpec.describe TemplateBinding, type: :model do
  let(:data) { { foo: 'bar' } }
  let(:binding) { TemplateBinding.new(data) }

  describe '#new' do
    it 'assigns attributes' do
      expect(binding.foo).to eq('bar')
    end
  end

  describe '#get_binding' do
    it 'returns a binding' do
      expect(binding.get_binding.class).to eq(Binding)
    end
  end
end
