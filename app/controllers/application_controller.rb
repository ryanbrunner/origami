class ApplicationController < ActionController::Base
  # check_authorization :unless => :devise_controller?
  protect_from_forgery

  layout proc{ |c| c.request.xhr? ? false : "application" }
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: "Access Denied"
  end
end
