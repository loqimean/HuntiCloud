require 'rails_helper'

RSpec.describe BaseService do
  it do
    expect do
      described_class.new
    end.to raise_exception('Cannot initialize an abstract BaseService class')
  end

  describe '#methods' do
    context 'with :call' do
      let(:expected_response) { { 'response': 200 } }

      it 'raises exception if a url was not given' do
        allow_any_instance_of(described_class).to receive(:initialize)
        allow(RestClient).to receive(:get).and_return(expected_response)

        expect(described_class.new.call('/hello')).to eq(expected_response)
      end
    end
  end
end
