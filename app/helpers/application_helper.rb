module ApplicationHelper
  def show_mobilization_bg
    "background: transparent url(#{@mobilization.background_image}) center top;" if @mobilization.background_image.present?
  end
end
