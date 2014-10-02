class PagesController < ApplicationController
  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:l] || I18n.default_locale
  end

  def founders
  end
end
