class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "password1",only: :index
	def index
	end
	def login
		admin=Admin.find_by(name:login_params[:name])
		if admin && admin.authenticate(login_params[:password])
			session[:admin_id]=admin.id
			redirect_to '/index1'
		else
			flash[:login_errors]=['Invalid password']
			redirect_to '/'
		end
	end
	def new
	end
	private
	def login_params
		params.require(:login).permit(:name,:password)
	end
end
