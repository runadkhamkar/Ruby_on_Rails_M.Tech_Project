class DashboardController < ApplicationController
	def index
		@customer=Customer.find(session[:customer_id])
		session[:customer_id]=@customer.id
	end
end
