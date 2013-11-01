class User < ActiveRecord::Base
  establish_connection "accounts_#{Rails.env}"
  has_many :activities

  def name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    "https://meurio-accounts.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
  end
end
