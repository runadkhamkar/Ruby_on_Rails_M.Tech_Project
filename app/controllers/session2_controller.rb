class Session2Controller < ApplicationController
	def create
		customer=Customer.find_by(email:login_params[:email])
		if customer && customer.authenticate(login_params[:password])
			session[:customer_id]=customer.id
			redirect_to '/dashboard'
		else
			flash[:login_errors]=['Invalid password']
			redirect_to '/'
		end
	end
	def destroy
	    session[:customer_id] = nil
	    redirect_to "/", notify:"Logged out!"
  end

	private
	def login_params
		params.require(:login).permit(:email,:password)
	end
end
