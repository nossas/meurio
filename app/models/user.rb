class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :first_name, :last_name, presence: true
  validates :email, format: { with: /([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}/ }
  validates :secondary_email, format: { with: /([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}/ }, allow_blank: true
  validates :password, on: :create, presence: true, length: { minimum: 6, maximum: 128 }
  validates :password, on: :update, allow_blank: true, length: { minimum: 6, maximum: 128 }
  validates :phone, format: { with: /\([\d]{2}\)\s[\d]{8,9}/ }, allow_blank: true
  validates :home_postcode, :work_postcode, format: { with: /[\d]{5}-[\d]{3}/ }, allow_blank: true
  
  mount_uploader :image, UserUploader

  def name
    "#{first_name} #{last_name}"
  end

  def active_for_authentication?
    true
  end
end
