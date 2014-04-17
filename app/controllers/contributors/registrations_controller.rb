class Contributors::RegistrationsController < Devise::RegistrationsController

	def create
		super
		new_user = User.new
		new_user[:email] = params[:contributor]["email"]
		new_user.save
		session[:user_profile] = new_user
	end

end