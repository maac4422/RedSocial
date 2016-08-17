class AccountsController < ApplicationController
	

	before_action :set_user
	before_action :authenticate_user!,only: [:update]
	before_action :authenticate_owner!,only: [:update]
	


	def show
		
	end

	def update
		
		respond_to do |format|
			if @user.update(user_params)
				format.html{redirect_to @user}
				format.json{ render :show }
			else
				format.html{redirect_to @user,notice:@user.errors.full_messages}
				format.json{ render json: @user.errors}				
			end
		end		
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:email,:username,:first_name,:last_name,:bio,:avatar,:cover)
		end

		def authenticate_owner!
			if current_user != @user
				redirect_to root_path, notice: "No estas autorizado",status: :unauthorized
			end
		end
end