class UsersController < InheritedResources::Base
  before_action(only: [:edit, :update]) { @user = current_user }
  before_action :authenticate_user!, except: :index

  layout false, only: :index

  def update
    update! notice: 'Perfil atualizado!'
  end

  def permitted_params
    {:user => params.require(:user).permit(:image, :first_name, :last_name, :email, :bio, :birthdate, :profession, :home_postcode, :phone, :secondary_email, :gender, :public, :home_address_street, :home_address_number, :home_address_extra, :home_address_district, :home_city, :home_state)}
  end
end
