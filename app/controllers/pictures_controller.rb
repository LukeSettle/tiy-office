class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

  def up
    @picture = Picture.find(params[:picture_id])
    if @picture.vote 1
      redirect_to pictures_path
    else
      puts "ERROR: Your vote was not counted"
    end
  end

  def down
    @picture = Picture.find(params[:picture_id])
    if @picture.vote -1
      redirect_to pictures_path
    else
      puts "ERROR: Your vote was not counted"
    end
  end

  def home
    @pictures = Picture.all
    @urls = []
    @pictures.each do |pic|
      @urls << pic.url
    end
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  def new
		authenticate_user!
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
		@picture.user_id = current_user.id
    if @picture.save
      redirect_to picture_path(@picture)
    else
      render "new"
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.destroy
      flash[:notice] = "You deleted this post :("
      redirect_to pictures_path
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to picture_path
  end

private
  def picture_params
    params.require(:picture).permit(:url, :title, :description, :user_id, :score)
  end
end
