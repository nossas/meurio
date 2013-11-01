module ApplicationHelper
  def show_mobilization_bg
    "background: #666 url(#{@mobilization.image}) center top no-repeat;" if @mobilization.image.present?
  end

  def states_for_select
    [ 'AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO' ]
  end
end
