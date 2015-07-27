require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe "#all" do
  	it "sorts pictures on votes" do
  		picture = FactoryGirl.create(:picture, score: 5)
  		picture2 = FactoryGirl.create(:picture, score: 8)
  		expect(Picture.all[0].score).to be > Picture.all[1].score
  	end
  end
end
