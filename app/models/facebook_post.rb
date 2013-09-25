class FacebookPost < ActiveRecord::Base
  validates_presence_of :hashtag, :username, :text, :published_at, :uid
  validates_uniqueness_of :uid

  auto_html_for :text do
    link :target => "_blank", :rel => "nofollow"
  end
end
