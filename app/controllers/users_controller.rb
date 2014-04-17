class UsersController < ApplicationController
	def signup
	end

	def save
	if @user = User.find_by_email(params[:user]["email"])
		@user.update_attributes(params[:user])
			if @user.save
				session[:user_profile] = @user
				redirect_to root_path
			else
				flash[:error] = "Profile update failed!"
				redirect_to edit_profile_path
			end
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

	def edit
		@user = User.find_by_email(current_contributor.email)
	end
end
