class PasswordsController < Devise::PasswordsController
  layout false, only: :new
  
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      redirect_to root_path, alert: resource.errors.full_messages.first
    end
  end
  
  protected
  
  def after_sending_reset_password_instructions_path_for(resource_name)
    root_path
  end
  
end