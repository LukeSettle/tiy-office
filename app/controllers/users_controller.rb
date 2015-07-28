class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def admin?
		current_user.admin
	end
end
