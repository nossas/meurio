class TaskTypesController < InheritedResources::Base
  load_and_authorize_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to ENV["MEURIO_ACCOUNTS_URL"] + "?redirect_url=#{request.url}"
  end

  def create
    create! do |success, failure|
      success.html { redirect_to task_types_path }
      failure.html { render :new }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to task_types_path }
      failure.html { render :edit }
    end
  end

  def permitted_params
    {:task_type => params.fetch(:task_type, {}).permit(:name, :points, :category_id, :mode, { :badge_ids => [] }) }
  end
end
