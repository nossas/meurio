class MobilizationsController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html, :js
  before_filter only: [:new, :create, :edit, :update] { @organizations = Organization.all }

  def index
    if request.xhr?
      mobilizations = Mobilization.order("created_at DESC").page(params[:page]).per(6)
      render mobilizations
    end
  end

  def show
    @facts = resource.facts.order("created_at DESC")
    @comments = resource.comments.order("published_at DESC").limit(5)
    show!
  end

  def create
    @mobilization.user_id = current_user.id
    create! do |success, failure|
      success.html { return redirect_to @mobilization }
      failure.html { redirect_to new_mobilization_path }
    end
  end

  def permitted_params
    {
      :mobilization => params
        .fetch(:mobilization, {})
        .permit(:title, :short_title, :hashtag, :description, :image, :thumbnail, :user_id, :organization_id)
    }
  end
end
