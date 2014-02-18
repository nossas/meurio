class TaskTypesController < InheritedResources::Base
  load_and_authorize_resource

  def permitted_params
    {:task_type => params.fetch(:task_type, {}).permit(:name, :points, :category_id)}
  end
end
