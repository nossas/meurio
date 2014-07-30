class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if cas_user.present?
      @current_user ||= User.find_by_email(cas_user['user'])
    end
  end

  def cas_user
    request.session['cas']
  end

  private

  def current_ability
    @current_ability ||= Ability.new(current_user, request)
  end
end
