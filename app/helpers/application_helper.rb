module ApplicationHelper
  def show_mobilization_bg
    "background: #666 url(#{@mobilization.image}) center top no-repeat;" if @mobilization.image.present?
  end
end
