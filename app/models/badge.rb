class Badge < ActiveRecord::Base
  mount_uploader :image, BadgeUploader
  validates :name, :points, :image, presence: true
end
