class UsersController < InheritedResources::Base
  layout false, only: [:index, :team, :funders]

  def show
    @activities = resource.activities.order("created_at DESC").limit(5)
    @matching_tasks = Task.matching(@user.skills)
    @subscribed_tasks = Task.subscribed(@user.id)
    @finished_tasks = Task.finished(@user.id)
    @succeed_poked_panela_campaigns = @user.panela_campaigns.successful

    @subscribed_tasks = @subscribed_tasks - @finished_tasks
  end

  def index
    @users = User.page(params[:page]).per(30)
  end

  def team
    @users = User.admins.order(:first_name)
    render :index
  end

  def funders
    @users = User.funders_or_sponsors.order(:first_name, :last_name).page(params[:page]).per(30)
    render :index
  end
end
