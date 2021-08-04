class CustomerController < ApplicationController
  def index
  end
  def reg_cust
  end

  def create
  	customer=Customer.new(customer_params)
		if customer.save
			session[:customer_id]=customer.id
			redirect_to '/dashboard'
		else
			flash[:register_errors]=customer.errors.full_messages
			redirect_to '/'
		end

	end

	private 
	def customer_params
		params.require(:customer).permit(:username,:email,:password,:password_confirmation,:address,:contact,:gender,:dob)
	end
end
