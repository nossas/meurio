class Campaign < ActiveRecord::Base
  validates :name, :link, :description_html, :hashtag, presence: true
  validates :uid, uniqueness: true
  belongs_to :mobilization, foreign_key: :hashtag
  has_many :pokes
end
