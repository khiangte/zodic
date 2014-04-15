class UsersController < ApplicationController
	def signup
	end

	def save
		@user = User.new(params[:user])
		if @user.save
			session[:user] = @user
			redirect_to root_path
		else
			flash[:error] = "Unable to register using the given username and email!"
			#redirect_to signup_path
		end
	end

	def login

	end

	def authenticate
		@user = User.find_by_user_name(params[:user]["user_name"])
		if @user[:password] == params[:user]["password"]
			session[:user] = @user
			redirect_to root_path
		else
			flash[:error] = "Wrong username or password"
			redirect_to login_path
		end
	rescue
		flash[:error] = "Wrong username or password"
		redirect_to login_path

	end

	def logout
		session[:user] = nil
		redirect_to root_path
	end
end
