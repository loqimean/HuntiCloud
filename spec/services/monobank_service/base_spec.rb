require 'rails_helper'

RSpec.describe MonobankService::Base do
  describe '#methods' do
    context 'with :currencies' do
      let(:monobank_service) { MonobankService::Base.new }
      let(:currencies_json) { %q{
          {
            "currencyCodeA": 840,
            "currencyCodeB": 980,
            "date": 1552392228,
            "rateSell": 27,
            "rateBuy": 27.2,
            "rateCross": 27.1
          }
        }
      }

      it 'returns currencies hash from JSON object' do
        allow(RestClient).to receive(:get).and_return(currencies_json)

        expect(monobank_service.currencies).to be_a(Hash)
        expect(monobank_service.currencies.blank?).to be_falsey
        expect(monobank_service.currencies.dig('currencyCodeA')).to eq(840)
      end

      it 'when there is no internet' do
        allow(RestClient).to receive(:get).and_raise(SocketError)

        expect(monobank_service.currencies).to eq(described_class::DEFAULT_CURRENCIES)
      end
    end
  end
end
