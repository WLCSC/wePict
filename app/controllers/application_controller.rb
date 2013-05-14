class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :check_for_user

  private
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
	@current_user
  end

  def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def check_for_user
		flash[:error] = "Please log in first." unless current_user
    redirect_to root_path unless current_user
  end
  
  def check_for_admin
		flash[:error] = "Only administrators can do that." unless current_user && current_user.admin?
    redirect_to root_path unless current_user && current_user.admin?
  end

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
	
end
