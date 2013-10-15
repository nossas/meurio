class UsersController < InheritedResources::Base
  before_action(only: :edit) { @user = current_user }
  before_action :authenticate_user!, except: :index

  layout false, only: :index
end
