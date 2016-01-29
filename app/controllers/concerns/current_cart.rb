module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    if Cart.exists? session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
 # rescue ActiveRecord::RecordNotFound   
    end
  end
  
end