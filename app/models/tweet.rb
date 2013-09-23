class Tweet < ActiveRecord::Base
  validates :username, :text, :hashtag, :published_at, presence: true
end
