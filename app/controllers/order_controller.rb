class OrderController < ApplicationController
	skip_before_action :verify_authenticity_token
	def place_order
		session[:customer_id]=session[:customer_id]
	end
	def save_order
		@order=Order.new(order_params)
		@order.status:"pending"
		@order.customer_id:session[:customer_id]
		if @order.save
			session[:order_id]=@order.id
			redirect_to '/dashboard'
		else
			flash[:order_errors]=order.errors.full_messages
			redirect_to '/dashboard'
		end

	end

	private 
	def order_params
		params.require(:order).permit(:address,:latitude,:longitude,:customer_id,:status,:image)
	end
end
