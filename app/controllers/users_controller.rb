class UsersController < InheritedResources::Base
  before_filter(only: :edit) { @user = current_user }
  layout false, only: :index
end
