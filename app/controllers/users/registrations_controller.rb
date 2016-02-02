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
       flash[:notice]= 'Unknown error occurred, user could not be saved. Please verify that you entered valid details'
       #a render/redirect error occurred here before, could not emulate it again: ask.
    end
  end

  #PUT
  def update
    super
    if current_user.has_role? :admin and User.with_role(:admin).count > 1
      @user.add_role(params[:role_name])
      @user.remove_role :admin
    elsif current_user.has_role? :waiter
      flash[:notice] = 'You do not have the authorization to change roles,
      any other information given has been updated'
      return
    elsif User.with_role(:admin).count <= 1
      flash[:notice] = 'Cannot change role since one admin HAS to remain on system. Other
      parameteres given have been changed'
      return
    end
  end

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:firstname, :lastname,
        :email, :password, :role_name,:password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:firstname, :lastname,
        :email, :password, :role_name, :password_confirmation, :current_password)
    end
  end



  
  
end