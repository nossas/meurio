class Event < ActiveRecord::Base
  validates :hashtag, :uid, presence: true
  validates :uid, uniqueness: true
end
