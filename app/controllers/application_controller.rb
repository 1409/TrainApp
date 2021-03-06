#Lässt uns mit einem Username anmelden 
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :username
  end
  protect_from_forgery with: :exception
end
