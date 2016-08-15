class Users::OmniauthCallbacksController < ApplicationController
	
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])

		#Validate if user exist in BD
		if @user.persisted?
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
		else
			session["devise.auth"] = request.env["omniauth.auth"]
			render :edit
		end
	
	end

	def custom_sign_up
		@user = User.from_omniauth(session["devise.auth"])
		if @user.update(user_params)
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
		else
			render :edit
		end
	end


	def failure
		redirect_to new_user_session_path , notice: "No pudiste loguearte. Error: #{params[:error_description]}. Motivo: #{params[:error_reason]}"
	end

	private

		def user_params
			params.require(:user).permit(:first_name,:email,:username)
		end
end