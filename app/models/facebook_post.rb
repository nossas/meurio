class FacebookPost < ActiveRecord::Base
  validates_presence_of :hashtag, :username, :text, :published_at, :uid
  validates_uniqueness_of :uid
end
