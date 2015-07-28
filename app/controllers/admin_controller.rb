class AdminController < ApplicationController
	def view
		@pictures = Picture.all
		@authors = Author.all
		@users = User.all
	end

end
