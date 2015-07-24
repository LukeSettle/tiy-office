class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

  def show
  	@author = Author.find(params[:id])
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
