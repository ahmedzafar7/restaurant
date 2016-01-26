class MenuController < ApplicationControlle
	load_and_authorize_resource
	include CurrentCart
	before_action :set_cart
  def index
  	@category = params[:category]
  	@foods = Food.order(:title)
  
  end
end
