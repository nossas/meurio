class Event < ActiveRecord::Base
  validates :hashtag, :uid, :name, :description, :link, presence: true
  validates :uid, uniqueness: true
end
