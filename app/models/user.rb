class User < ActiveRecord::Base
  has_many :activities
  scope :admins, -> { where(admin: true) }
  scope :funders, -> { where(funder: true) }

  def name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    if self.avatar
      "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
    else
      "http://i.imgur.com/lsAFCHL.jpg"
    end
  end
end
