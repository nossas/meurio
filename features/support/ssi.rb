Before('@ssi') do
  class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
      @current_user ||= User.find_by_email("ssi@meurio.org.br")
    end
  end
end
