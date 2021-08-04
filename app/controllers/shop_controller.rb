class ShopController < ApplicationController
  def index

  end
  def reg_shop
  end
  def create
	shop=Shop.new(shop_params)
	if shop.save
		session[:shop_id]=shop.id
		redirect_to '/medical'
	else
		flash[:register_errors]=shop.errors.full_messages
		redirect_to '/'
	end


	end

	private
	def shop_params
		params.require(:shop).permit(:username,:email,:password,:password_confirmation,:address,:contact,:shopid,:latitude,:longitude)
	end
end
