class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize_admin
  before_filter :set_vars
  protect_from_forgery with: :exception


  protected
  	def authorize_admin
  		unless User.find_by(id: session[:user_id])
  			redirect_to login_url, notice: "Please log in"
  		end
  	end

  	def set_vars
  		@current_user = User.find(session[:user_id]) if session[:user_id]
  		@total_orders = Order.count
  	end
end
