class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :resource, :resource_name, :devise_mapping
  before_action :configure_permitted_parameters, if: :devise_controller?

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  protected

  # def configure_premitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :username, :birthday, :email, :password, :remember_me)}
  #   devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:email, :password, :remember_me)}
  #   devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :username, :birthday, :about, :email, :password, :remember_me)}
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :username, :birthday, :email, :password, :remember_me)
    end

    devise_parameter_sanitizer.for(:account_update) do |user_params|
      user_params.permit(:first_name, :last_name, :username, :birthday, :about, :email, :password, :current_password, :remember_me)
    end
  end

  
end
 