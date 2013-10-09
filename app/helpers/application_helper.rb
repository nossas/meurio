module ApplicationHelper
  def show_mobilization_bg
    "background: #666 url(#{@mobilization.image}) center top no-repeat;" if @mobilization.image.present?
  end

  def resource_name
    :user
  end
 
  def devise_resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
