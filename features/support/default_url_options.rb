class ApplicationController < ActionController::Base
  def default_url_options(options = {})
    { :locale => "pt" }
  end
end

class ActionDispatch::Routing::RouteSet
  def default_url_options(options={})
    { :locale => "pt" }
  end
end
