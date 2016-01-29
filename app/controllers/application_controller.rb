class ApplicationController < ActionController::Base
   
    rescue_from CanCan::AccessDenied, with: :unauthorized_access
    rescue_from ActionController::RoutingError, with: :render_404

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # before_action :authorize_admin
 
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  protected
  def unauthorized_access
    logger.error "Permission denied for access"
    redirect_to :root, notice: 'Permission Denied'
  end

  def render_404
    redirect_to :root, notice: 'Page not found'   
  end

end
