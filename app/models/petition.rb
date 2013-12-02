class Petition < ActiveRecord::Base
  validates :name, :link, :description_html, :hashtag, presence: true
  validates :uid, uniqueness: true
end
