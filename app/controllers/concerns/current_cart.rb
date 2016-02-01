module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    unless @cart = Cart.find_by_id(session[:cart_id])
      @cart = Cart.create and session[:cart_id] = @cart.id      
    end       
  end
  
end