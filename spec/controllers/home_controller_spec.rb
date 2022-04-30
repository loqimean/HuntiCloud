require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  context 'when user logged in' do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    describe 'GET #index' do
      let(:gallery) { create(:gallery) }
      let(:galleries_count) { Gallery.ordered.count.to_s }
      let(:currencies) do
        [
          {"currencyCodeA"=>978, "currencyCodeB"=>980, "date"=>1650661807, "rateBuy"=>31.6, "rateSell"=>32.5002},
          {"currencyCodeA"=>840, "currencyCodeB"=>980, "date"=>1650661807, "rateBuy"=>29.255, "rateSell"=>30.0003}
        ]
      end

      it 'should be succesful' do
        allow_any_instance_of(MonobankService::Base).to receive(:currencies) { currencies }

        get :index

        expect(response).to be_successful
        expect(response).to render_template(:index)
        expect(response.body).to include(galleries_count)
        expect(response.body).to include(currencies[0]['rateBuy'].to_s)
      end
    end
  end
end
