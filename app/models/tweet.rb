class Tweet < ActiveRecord::Base
  validates :username, :text, :hashtag, :published_at, :uid, presence: true
  validates :uid, uniqueness: true
end
