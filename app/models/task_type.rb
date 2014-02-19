class TaskType < ActiveRecord::Base
  belongs_to :category
  has_many :tasks
  has_and_belongs_to_many :badges
  accepts_nested_attributes_for :badges
  
  validates :name, :points, :mode, :category_id, presence: true
end
