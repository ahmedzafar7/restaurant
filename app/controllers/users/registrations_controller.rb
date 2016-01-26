# controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  
  def create
    #byebug #debugging
    super
  @user.add_role(params[:role_name])
  end

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:firstname, :lastname,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:firstname, :lastname,
        :email, :password, :password_confirmation, :current_password)
    end
  end
end