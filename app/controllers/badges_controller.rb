class BadgesController < InheritedResources::Base
  load_and_authorize_resource

  def create
    create! do |success, failure|
      success.html { redirect_to badges_path }
      failure.html { render :new }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to badges_path }
      failure.html { render :edit }
    end
  end

  def permitted_params
    {:badge => params.fetch(:badge, {}).permit(:name, :points, :image)}
  end
end
