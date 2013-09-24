class Image < ActiveRecord::Base
  validates :url, :hashtag, presence: true
  validates :url, uniqueness: true
end
