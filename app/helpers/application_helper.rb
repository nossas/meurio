module ApplicationHelper
  def show_mobilization_bg
    "background: transparent url(#{@mobilization.image}) center top;" if @mobilization.image.present?
  end
end
