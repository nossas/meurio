class Campaign < ActiveRecord::Base
  validates :name, :link, :description_html, :mobilization_id, presence: true
  validates :uid, uniqueness: true
  belongs_to :mobilization
  has_many :pokes
end
