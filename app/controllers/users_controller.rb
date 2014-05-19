class UsersController < InheritedResources::Base
  before_action(only: :show) { @activities = resource.activities.order("created_at DESC").limit(5) }
  before_action(only: :show) { @matching_tasks = Task.matching(@user.skills) }
  before_action(only: :show) { @subscribed_tasks = Task.subscribed(@user.id) }
  before_action(only: :show) { @finished_tasks = Task.finished(@user.id) }

  layout false, only: [:index, :team, :funders]

  def index
    @users = User.order("created_at DESC").page(params[:page]).per(30)
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
