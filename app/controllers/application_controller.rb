class ApplicationController < ActionController::Base
    include CanCan::ControllerAdditions
    rescue_from CanCan::AccessDenied, with: :unauthorized_access


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # before_action :authorize_admin
  before_filter :set_vars
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  protected
  #	def authorize_admin
  #		unless User.find_by(id: session[:user_id])
  #			redirect_to login_url, notice: "Please log in"
  #		end
  #	end

  	def set_vars
  		#@current_user = User.find(session[:user_id]) if session[:user_id]
  		#@total_orders = Order.count
  	end

    def unauthorized_access
      logger.error "Permission denied for access"
      #referrer url
     # session[:return_to] ||= request.referer
      redirect_to :root, notice: 'Permission Denied'
    end
end
