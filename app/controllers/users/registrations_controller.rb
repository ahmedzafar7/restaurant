# controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  #POST
  def create
    #byebug #debugging
    super
    if @user.persisted? && Role.exists?(name: params[:role_name])
       @user.add_role(params[:role_name]) 
    else
       @user.destroy
       redirect_to :root, notice: 'Unknown error occurred, user could not be saved. Please verify that you entered valid details'
       #a render/redirect error occurred here before, could not emulate it again: ask.
    end
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