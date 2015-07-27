class PicturesController < ApplicationController
	def index
		@pictures = Picture.all.sort_by do |pic|
      -pic[:score]
    end
	end

  def up
    @picture = Picture.find(params[:picture_id])
    @picture.score += 1
    if @picture.save
      redirect_to pictures_path
    else
      puts "ERROR: Your vote was not counted"
    end
  end

  def down
    @picture = Picture.find(params[:picture_id])
    @picture.score += -1
    if @picture.save
      redirect_to pictures_path
    else
      puts "ERROR: Your vote was not counted"
    end
  end

  def home
    @pictures = Picture.all.sort_by do |pic|
      -pic[:score]
    end
    @urls = []
    @pictures.each do |pic|
      @urls << pic.url
    end
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
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
    params.require(:picture).permit(:url, :title, :description, :author_id, :score)
  end
end
