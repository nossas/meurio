class TaskType < ActiveRecord::Base
  belongs_to :category
  has_many :tasks
  validates :name, :points, :category_id, presence: true
end
