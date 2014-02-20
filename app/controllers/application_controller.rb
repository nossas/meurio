class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  before_filter { session[:ssi_user_id] = params[:sign_in] if Rails.env.development? && params[:sign_in] }

  def current_user
    @current_user ||= User.find_by_id(session[:ssi_user_id])
  end
end
