require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe 'GET #index' do
    let(:galleries_count) { Gallery.ordered.count.to_s }

    it 'should be succesful' do
      get :index

      expect(response).to render_template(:index)
      expect(response).to be_successful
      expect(response.body).to include(galleries_count)
    end
  end
end
