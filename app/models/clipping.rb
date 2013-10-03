class Clipping < ActiveRecord::Base
  validates :published_at, :body, :link, :image, :hashtag, :uid, presence: true
  validates :uid, uniqueness: true
end
