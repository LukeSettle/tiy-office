require 'rails_helper'
RSpec.describe PicturesController do
	let (:picture) {FactoryGirl.create(:picture)}
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #up" do
  	it "adds 1 to score" do
  		put :up, picture_id: picture.id
  		picture.reload
  		expect(picture.score).to eq 1
  	end
  end

  describe "PUT #down" do
    it "subtracts 1 to score" do
      put :down, picture_id: picture.id
      picture.reload
      expect(picture.score).to eq -1
    end
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "makes a new picture" do
      post :create, picture: FactoryGirl.attributes_for(:picture)
      expect(response).to have_http_status(:success)
    end
  end
end