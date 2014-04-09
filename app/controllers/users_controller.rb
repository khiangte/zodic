class UsersController < ApplicationController
	def signup
	end

	def save
		@user = User.new(params[:user])
		@user.save
		session[:user] = @user
		redirect_to root_path
	end

	def login

	end

	def authenticate
		@user = User.find_by_user_name(params[:user]["user_name"])
		if @user[:password] == params[:user]["password"]
			session[:user] = @user
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	def logout
		session[:user] = nil
		redirect_to root_path
	end
end
