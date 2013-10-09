class MobilizationsController < InheritedResources::Base
  respond_to :html, :js
  
  def show
    @facts = resource.facts.order("created_at DESC")
    @comments = resource.comments.order("published_at DESC").limit(5)
    show!
  end

  def create
    create! do |success, failure|
      success.html { return redirect_to @mobilization }
      failure.html { redirect_to new_mobilization_path }
    end
  end

  def permitted_params
    {:mobilization => params.fetch(:mobilization, {}).permit(:title, :short_title, :hashtag, :description, :image)}
  end
end
