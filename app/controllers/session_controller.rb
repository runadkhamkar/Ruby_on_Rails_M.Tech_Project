class SessionController < ApplicationController
	def create
		shop=Shop.find_by(email:login_params[:email])
		if shop && shop.authenticate(login_params[:password])
			session[:shop_id]=shop.id
			redirect_to '/medical'
		else
			flash[:login_errors]=['Invalid password']
			redirect_to '/'
		end
	end
	def destroy
	    session[:shop_id] = nil
	    redirect_to "/", notice: "Logged out!"
  end

	private
	def login_params
		params.require(:login).permit(:email,:password)
	end
end
