require 'rails_helper'
require 'byebug'
RSpec.describe PicturesController, type: :controller do
	let (:picture) {FactoryGirl.create(:picture)}
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Up" do
  	it "adds 1 to score" do
  		put :up, picture_id: picture.id
  		picture.reload
  		expect(picture.score).to eq 1
  	end
  end
end
