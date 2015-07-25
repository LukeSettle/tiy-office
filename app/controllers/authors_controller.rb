class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

  def show
  	@author = Author.find(params[:id])

    @authorpics = @author.pictures.sort_by do |pic|
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
      redirect_to show_path
    else
      puts "ERROR: Your vote was not counted"
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to new_picture_path
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      flash[:notice] = "You deleted this post :("
      redirect_to authors_path
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to author_path
  end

private
  def author_params
    params.require(:author).permit(:name)
  end
end
