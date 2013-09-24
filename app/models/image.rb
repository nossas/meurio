class Image < ActiveRecord::Base
  validates :file, :hashtag, :uid, presence: true
  validates :uid, uniqueness: true

  mount_uploader :file, ImageUploader
end
