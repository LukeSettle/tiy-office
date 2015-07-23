require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
	let (:picture) {FactoryGirl.create(:picture)}
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
