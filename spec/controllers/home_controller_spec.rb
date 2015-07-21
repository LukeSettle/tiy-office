require 'rails_helper'

RSpec.describe HomeController do
  describe 'GET #index' do
    it "works" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end