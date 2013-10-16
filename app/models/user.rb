class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :first_name, :last_name, presence: true
  validates :email, format: { with: /([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}/ }
  validates :password, on: :create, presence: true, length: { minimum: 6, maximum: 128 }
  validates :password, on: :update, allow_blank: true, length: { minimum: 6, maximum: 128 }
  
  mount_uploader :image, UserUploader

  def name
    "#{first_name} #{last_name}"
  end
end
