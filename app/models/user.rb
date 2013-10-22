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
  validates :home_postcode, format: { with: /[\d]{5}-[\d]{3}/ }, allow_blank: true
  
  mount_uploader :image, UserUploader

  after_save { self.delay.fetch_address }

  def name
    "#{first_name} #{last_name}"
  end

  def active_for_authentication?
    true
  end

  def fetch_address
    json = JSON.parse(open("http://brazilapi.herokuapp.com/api?cep=#{self.home_postcode}").read)
    if(json[0]["cep"]["result"])
      address = json[0]["cep"]["data"]
      if(self.home_city != address["cidade"] || self.home_address_street != "#{address["tp_logradouro"]} #{address["logradouro"]}" || self.home_address_district != address["bairro"] || self.home_state != address["uf"])
        self.update_attributes(home_city: address["cidade"], home_address_street: "#{address["tp_logradouro"]} #{address["logradouro"]}", home_address_district: address["bairro"], home_state: address["uf"])
      end
    end
  end
end
