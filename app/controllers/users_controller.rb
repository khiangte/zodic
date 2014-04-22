class UsersController < ApplicationController
	before_filter :authenticate_contributor!

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

	def edit
		@user = User.find_by_email(current_contributor.email)
	end

	def deny_admin
		redirect_to root_path if !session[:user_profile].admin
		user = User.find(params[:id])
		user.admin = false
		user.save
		redirect_to user_list_path
	end

	def make_admin
		redirect_to root_path if !session[:user_profile].admin
		user = User.find(params[:id])
		user.admin = true
		user.save
		redirect_to user_list_path
	end

	def user_list
		redirect_to root_path if !session[:user_profile].admin
		@user_list = User.where("email != ?","admin@zodic.in")
	end

	def admin_roles
		redirect_to edit_profile_path if !session[:user_profile].admin
	end
end
