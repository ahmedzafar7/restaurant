class MenuController < ApplicationController
	include CurrentCart
	before_action :set_cart
  def index
  	@foods = Food.order(:title)
  
  end
end
