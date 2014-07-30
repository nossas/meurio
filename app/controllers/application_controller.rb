class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  # TODO: move this development environment login workaround to the proper gem (rack-cas for example)
  before_filter { session['cas'] = { 'user' => params[:sign_in] } if Rails.env.development? && params[:sign_in] }

  def current_user
    @current_user ||= User.find_by_email(session['cas']['user']) if session['cas']
  end

  private

  def current_ability
    @current_ability ||= Ability.new(current_user, request)
  end
end
