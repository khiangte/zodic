class Contributors::SessionsController < Devise::SessionsController

	def create
		super
		session[:user_profile] = User.find_by_email(current_contributor.email)
	end

end