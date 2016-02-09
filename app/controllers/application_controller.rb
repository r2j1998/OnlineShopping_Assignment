class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters , if: :devise_controller?

  protected

  def configure_permitted_parameters
  	#raise params.inspect
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:fname, :lname , :email, :password , :birth_date , :mobile_no, shipping_addresses_attributes: [:city , :district , :state ,:country ,  :pincode])}
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email , :password)}
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:fname, :lname ,:email,:password ,:birth_date ,:mobile_no , shipping_addresses_attributes: [:city , :district , :state , :country , :pincode])}
  	
  end
end
