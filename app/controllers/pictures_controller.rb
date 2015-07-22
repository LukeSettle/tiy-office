class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

  def home
    @urls = Picture.all.limit(6).pluck(:url)
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
    redirect_to picture_path(@picture)
  end
 
private
  def picture_params
    params.require(:picture).permit(:url, :title, :description, :author)
  end
end
