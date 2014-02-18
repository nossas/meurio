class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  before_filter { session[:ssi_user_id] = params[:sign_in] if Rails.env.development? && params[:sign_in] }

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to ENV["MEURIO_ACCOUNTS_URL"] + "?redirect_url=#{request.url}"
  end

  def current_user
    @current_user ||= User.find_by_id(session[:ssi_user_id])
  end
end
