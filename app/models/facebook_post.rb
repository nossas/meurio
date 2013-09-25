class FacebookPost < ActiveRecord::Base
  validates :hashtag, :username, :text, :published_at, :uid, presence: true
  validates :uid, uniqueness: true

  auto_html_for :text do
    link target: :blank, rel: :nofollow
    hashtag source: :facebook
  end
end
