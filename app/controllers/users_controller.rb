class UsersController < InheritedResources::Base
  before_action(only: [:edit, :update]) { @user = current_user }
  before_action :authenticate_user!, except: :index

  layout false, only: :index

  def update
    update! notice: 'Perfil atualizado!'
  end

  def permitted_params
    {:user => params.require(:user).permit(:first_name, :last_name, :bio, :birthdate, :profession, :phone, :secondary_email, :gender, :public)}
  end
end
