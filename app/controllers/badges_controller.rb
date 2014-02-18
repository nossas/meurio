class BadgesController < InheritedResources::Base
  load_and_authorize_resource

  def permitted_params
    {:badge => params.fetch(:badge, {}).permit(:name, :points, :image)}
  end
end
