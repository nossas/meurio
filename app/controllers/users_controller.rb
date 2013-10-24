class UsersController < InheritedResources::Base
  load_and_authorize_resource
  before_action(only: [:edit, :update]) { @user = current_user }
  before_action(only: :show) { @activities = @user.activities.order("created_at DESC").limit(5) }

  layout false, only: :index

  def update
    update! notice: 'Perfil atualizado!'
  end

  def permitted_params
    {:user => params.require(:user).permit(:image, :first_name, :last_name, :email, :bio, :birthdate, :profession, :home_postcode, :phone, :secondary_email, :gender, :public, :home_city, :home_state, :facebook_url, :twitter_url, :website)}
  end
end
