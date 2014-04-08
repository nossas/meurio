class Badge < ActiveRecord::Base
  has_and_belongs_to_many :task_types
  has_many :achievements
  has_many :users, through: :achievements

  default_scope { order(:name) }

  mount_uploader :image, BadgeUploader
  validates :name, :points, :image, presence: true

  def self.for_volunteer_time
    self.find_by(name: 'Eu Faço')
  end
end
