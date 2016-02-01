class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  load_and_authorize_resource
  # before_action :set_cart, only: [:show, :update, :destroy] #using load_and_authorize_resource
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  
 
  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to :root }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_cart
   # @cart = Cart.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    #cart table only contains id, created at and updated at, not meant to be edited by admin or user
    #perhaps I should disable edit entirely?
    params.permit()
  end

 

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to :root, notice: 'Invalid Cart'
  end
  
end
