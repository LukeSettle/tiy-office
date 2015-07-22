class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

  def show
  	@picture = Picture.find(params[:id])
  end

  def create
  @picture = picture.new(picture_params)
 
  @picture.save
  redirect_to @picture
end
 
private
  def picture_params
    params.require(:picture).permit(:url, :title, :description)
  end
end
