class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.js? }
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street, :street_number, :city, :country, :payment_info, :profile_image])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:street, :street_number, :city, :country, :payment_info, :profile_image])
  end
end
