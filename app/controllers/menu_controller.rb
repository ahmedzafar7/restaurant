class MenuController < ApplicationController
	load_and_authorize_resource
	include CurrentCart
	before_action :set_cart

	#GET /menu/index
  def index
  	@category = params[:category]
  	@foods = Food.order(:title)  
  end

end
