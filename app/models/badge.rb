class Badge < ActiveRecord::Base
  mount_uploader :image, BadgeUploader
end
