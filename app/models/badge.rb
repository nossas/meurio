class Badge < ActiveRecord::Base
  has_and_belongs_to_many :task_types

  mount_uploader :image, BadgeUploader
  validates :name, :points, :image, presence: true
end
