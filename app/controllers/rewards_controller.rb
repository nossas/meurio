class RewardsController < InheritedResources::Base
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token
  respond_to :json

  rescue_from CanCan::AccessDenied do |exception|
    render nothing: true, status: 403
  end

  def permitted_params
    {:reward => params.fetch(:reward, {}).permit(:user_id, :task_type_id, :points, :source_app, :source_model, :source_id)}
  end
end
